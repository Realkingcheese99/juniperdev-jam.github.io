
if(keyboard_check(ord("A"))) {
	dir = 1;
		if(place_meeting(x-1,y-1,obj_tile)) {
		onWall = true
		airtime = 0.8
	} else {
		onWall = false;
	}
	if(abs(xVel)<=spd) {
	xVel = -spd;
	} else if(grounded == false) {
		if(sign(xVel == 1)) {
			xVel -= 2*spd*air_resistance
	}

	}
} else if(keyboard_check(ord("D"))) { 
	dir = 2;
	show_debug_message("right");
	if(place_meeting(x+1,y-1,obj_tile)) {
		onWall = true
		airtime = 0.8
		show_debug_message("ON WALL");
	} else {
		onWall = false;
	}
	if(abs(xVel)<=spd) {
	xVel = spd;
	} else if(grounded == false) {
		if(sign(xVel == -1)) {
			xVel += 2*spd*air_resistance
	}
	
		
	}
	}
	if(instance_exists(obj_hook)){
if(keyboard_check_pressed(ord("F"))) {

	hooktime = 0;
	collision = false;
	nearest_hook = instance_nearest(x,y,obj_hook);
	dx = (x-(nearest_hook.x+nearest_hook.sprite_width/2))
	dy = (y-(nearest_hook.y+nearest_hook.sprite_height/2))
	distance = sqrt(sqr(dx)+sqr(dy));
	if(distance < 50/4) {
		distance = 50/4;
	}
	hookAngle = arccos((dy/distance));
	release_modifier = distance/5000+0.03;
	//show_debug_message(string_concat(y, "; ", nearest_hook.y+nearest_hook.sprite_height/2-distance*sin(hookAngle)-sprite_height/2))
}

if(keyboard_check(ord("F"))) {
	if(distance <=200/4) {
		
if(collision == false) {
	hooked = true;
if(hooked == true) {

	x=nearest_hook.x+nearest_hook.sprite_width/2+sign(dx)*distance*sin(hookAngle)
	y=nearest_hook.y+nearest_hook.sprite_height/2+distance*cos(hookAngle)
	show_debug_message(y);
		hookAngle-=0.15;
		hooktime += 0.03
	}
	}
}
}
	}


if((jumping == true) && (jumptime < 15) && (keyboard_check(vk_space) || keyboard_check(ord("W")))) {
	jumptime++;
	airtime = -0.01
	if(walljump == true) {
		airtime = -0.02;
		if(dir == 1) {
			xVel = spd;
		} else if(dir == 2) {
			xVel = -spd;
		}
	}
}
if(jumptime >= 10) {
	dir = abs(dir-1) + 1;
}