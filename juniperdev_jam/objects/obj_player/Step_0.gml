if(global.interact == 0) {

//y velocity calculations
grav = heaviness*airtime;
upvel = floatiness*(1-airtime);
if(airtime!=1){
yVel = (grav-upvel);
} else {
	yVel = 0;
}



// --collision

//hitting head
if(place_meeting(x,y-1,obj_tile)) {
	ceiling = true;
	y+=1;
	airtime = 1;
	collision = true;
} else {
	ceiling = false;
}
//jumping
if((place_meeting(x,y+2,obj_tile) && ceiling == false) || grounded == false) {
	if(hooked == false) {
	y+=yVel/4;
	}
}
//horizontal
for(i = 0; i<abs(rVel-lVel); i++) {
if(!place_meeting(x+2*sign(xVel+(rVel-lVel)),y-1,obj_tile)) {
	x+=(((xVel)+(rVel-lVel))/16);
} else {
	hooked = false;
	image_index = 1;
	image_speed = 0;
}
}
//landing
if(!place_meeting(x,y+2,obj_tile)) {
	grounded = false;
	airtime += 0.03
	xVel *= (1-air_resistance);
} else {
	airtime = 1;
	grounded = true;
	airjumps = 0;
	xVel *= (1-ground_friction);
	collision = true;
}

}


//testing, brings player back to spawn when falling off
if(y>room_height) {
y = global.playerY;
x = global.playerX;
}

if(place_meeting(x,y,obj_tile)) {
	hooked = false
	collision = true;
}

//vertical collision boxes
instance_destroy(obj_collision);
instance_create_depth(x-3-(2*sign(xVel)),y-sprite_height/4-2,0,obj_collision, {
	type: 0,
	height: sprite_height/4,
	width: 9
})
instance_create_depth(x-3-(2*sign(xVel)),y-2,0,obj_collision, {
	type: 1,
	height: sprite_height/2,
	width: 9
})


if(collision == true) {
	hooked = false;
}

hooktime = clamp(hooktime,0,1)
//show_debug_message(airjumps);
//show_debug_message(airtime);
//anim switching
if(hooked == true) {
	// Figuring out distance to hook point without messing up spinning
	
	angle_calc_hookpoint = instance_nearest(x,y,obj_hook);

	angle_calc_dx = (x-(angle_calc_hookpoint.x+angle_calc_hookpoint.sprite_width/2))
	angle_calc_dy = (y-(angle_calc_hookpoint.y+angle_calc_hookpoint.sprite_height/2))
	
	// Find angle
	
	if (angle_calc_dy >= 0){
		deg_to_hook = 90 - radtodeg(arctan(angle_calc_dx / angle_calc_dy))
	}
	else if (angle_calc_dx < 0){
		deg_to_hook = 270 - radtodeg(arctan(angle_calc_dx / angle_calc_dy))
	}
	
	// Change sprite based on angle
	
	if ((deg_to_hook >= 0 && deg_to_hook < 22) || (deg_to_hook <= 360 && deg_to_hook > 338)){
		
		//show_debug_message($"point left, deg: {deg_to_hook}")
		sprite_index = spr_point_left;
	}
	else if (deg_to_hook >= 23 && deg_to_hook < 67){
	//	show_debug_message($"point up left, deg: {deg_to_hook}")
		sprite_index = spr_point_up_left;
	}
	else if (deg_to_hook >= 68 && deg_to_hook < 122){
	//show_debug_message($"point up, deg: {deg_to_hook}")
		sprite_index = spr_point_up;

	}
	else if (deg_to_hook >= 113 && deg_to_hook < 157){
	//	show_debug_message($"point up right, deg: {deg_to_hook}")
		sprite_index = spr_point_up_right;

	}
	else if (deg_to_hook >= 158 && deg_to_hook < 202){
	//	show_debug_message($"point right, deg: {deg_to_hook}")
		sprite_index = spr_point_right;

	}
	else if (deg_to_hook >= 203 && deg_to_hook < 247){
	//	show_debug_message($"point down right, deg: {deg_to_hook}")
		sprite_index = spr_point_down_right;

	}
	else if (deg_to_hook >= 248 && deg_to_hook < 292){
	//	show_debug_message($"point down, deg: {deg_to_hook}")
		sprite_index = spr_point_down;

	}
	else if (deg_to_hook >= 293 && deg_to_hook < 337){
	//f	show_debug_message($"point down left, deg: {deg_to_hook}")
		sprite_index = spr_point_down_left;

	}
	

} else if(abs(airtime) > 1.001|| abs(airtime)<0.999) {
	sprite_index = sprPlayerJump;

	image_speed = 0;
} else if(abs(xVel+rVel-lVel>0.1)) {
	sprite_index = sprPlayerWalk
	image_speed = 1;
} else if(abs(xVel+rVel-lVel) <= 0.1) {
	//idle anim
	sprite_index = sprPlayerWalk
	image_speed = 0;
}
if(xVel+rVel-lVel!=0) {
image_xscale = dir;
}
if(place_meeting(x+2*dir,y, obj_tile)) { // && (keyboard_check(ord("A")) || keyboard_check(ord("D")))
if(airtime > 0.8) {
	airtime = 0.8;
}
	onWall = true;

} else {
	onWall = false;
}



lVel = lerp(0,spd,leftTime);
rVel = lerp(0,spd,rightTime);
//show_debug_message((rVel-lVel)/4);
if(walljump == false) {
	if(grounded == true) {
		if(!keyboard_check(ord("A"))) {
	leftTime *= (1-ground_friction);
}
if(!keyboard_check(ord("D"))) {
	rightTime *= (1-ground_friction);
}
	} else {
if(!keyboard_check(ord("A"))) {
	leftTime *= (1-air_resistance);
}
if(!keyboard_check(ord("D"))) {
	rightTime *= (1-air_resistance);
}
}
}
//show_debug_message($"lVel: {lVel}, rVel: {rVel}, xVel: {xVel}");

//show_debug_message(onWall);
//show_debug_message(1/abs(airtime));
//show_debug_message(airtime);
//show_debug_message($"xvel: {xVel}, yvel: {yVel}");