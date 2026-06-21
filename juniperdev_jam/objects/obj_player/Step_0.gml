

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
for(i = 0; i<abs(xVel); i++) {
if(!place_meeting(x+sign(xVel),y-1,obj_tile)) {
	x+=(xVel/16);
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
	
	// Finding angles based on quandrants
	
	if (angle_calc_dy >= 0){
		deg_to_hook = 90 - radtodeg(arctan(angle_calc_dx / angle_calc_dy))
	}
	else if (angle_calc_dx < 0){
		deg_to_hook = 270 - radtodeg(arctan(angle_calc_dx / angle_calc_dy))
	}
	
	if ((deg_to_hook >= 0 && deg_to_hook < 22) || (deg_to_hook <= 360 && deg_to_hook > 338)){
		show_debug_message("point left")
		sprite_index = spr_point_left;
	}
	else if (deg_to_hook >= 23 && deg_to_hook < 67){
		show_debug_message("point up left")
		sprite_index = spr_point_left;
	}
	else if (deg_to_hook >= 68 && deg_to_hook < 122){
		show_debug_message("point up")
		sprite_index = spr_point_left;

	}
	else if (deg_to_hook >= 113 && deg_to_hook < 157){
		show_debug_message("point up right")
		sprite_index = spr_point_left;

	}
	else if (deg_to_hook >= 158 && deg_to_hook < 202){
		show_debug_message("point right")
		sprite_index = spr_point_left;

	}
	else if (deg_to_hook >= 203 && deg_to_hook < 247){
		show_debug_message("point down right")
		sprite_index = spr_point_left;

	}
	else if (deg_to_hook >= 248 && deg_to_hook < 292){
		show_debug_message("point down")
		sprite_index = spr_point_left;

	}
	else if (deg_to_hook >= 293 && deg_to_hook < 337){
		show_debug_message("point down left")
		sprite_index = spr_point_left;

	}
	

} else if(abs(airtime) > 1.001|| abs(airtime)<0.999) {
	sprite_index = sprPlayerJump;

	image_speed = 0;
} else if(abs(xVel>0.1)) {
	sprite_index = sprPlayerWalk
	image_speed = 1;
} else if(abs(xVel) <= 0.1) {
	//idle anim
	sprite_index = sprPlayerWalk
	image_speed = 0;
}
if(xVel!=0) {
image_xscale = sign(xVel);
}



//show_debug_message(onWall);
//show_debug_message(1/abs(airtime));
//show_debug_message(airtime);
//show_debug_message($"xvel: {xVel}, yvel: {yVel}");