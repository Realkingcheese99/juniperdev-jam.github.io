

//y velocity calculations
grav = heaviness*airtime;
upvel = floatiness*(1-airtime);
yVel = (grav-upvel);



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
if((!place_meeting(x,y+1,obj_tile) && ceiling == false) || grounded == false) {
	if(hooked == false) {
	y+=yVel/4;
	}
}
//horizontal
if(!place_meeting(x+1,y-1,obj_tile)) {
	x+=xVel/4;
} else {
	hooked = false;
}
//landing
if(!place_meeting(x,y+1,obj_tile)) {
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
instance_create_depth(x,y,0,obj_collision, {
	type: 0,
	height: sprite_height/2,
	width: sprite_width
})
instance_create_depth(x,y+sprite_height/2,0,obj_collision, {
	type: 1,
	height: sprite_height/2,
	width: sprite_width
})


if(collision == true) {
	hooked = false;
}

hooktime = clamp(hooktime,0,1)
//show_debug_message(airjumps);
//show_debug_message(airtime);