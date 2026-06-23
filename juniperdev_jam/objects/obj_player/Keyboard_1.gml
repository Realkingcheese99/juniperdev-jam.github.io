if(global.interact == 0) {
if(keyboard_check(ord("A"))) {
	dir = DIRECTION.LEFT;
	if(leftTime+acceleration <= 1) {
	leftTime += acceleration;
	}
	if(abs(xVel)<=spd) {
//	xVel = -spd;
	}

} else if(keyboard_check(ord("D"))) { 
	dir = DIRECTION.RIGHT;
		if(rightTime+acceleration <= 1) {
	rightTime += acceleration;
	}
	if(abs(xVel)<=spd) {
//	xVel = spd;
	}
}
	if(instance_exists(obj_hook)){
if(keyboard_check_pressed(ord("F"))) {
	hooktime = 0;
	collision = false;
	nearest_hook = instance_nearest(x,y,obj_hook);
	dx = (x-(nearest_hook.x+nearest_hook.sprite_width/2));
	dy = (y-(nearest_hook.y+nearest_hook.sprite_height/2));
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
		hooktime += 0.03;
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
		if(dir == DIRECTION.LEFT) {
			rightTime = 0.8;
			leftTime = 0;
			
		} else {
			leftTime = 0.8;
			rightTime = 0;
		}
	alarm[0] = 5;
	}
}
if(jumptime >= 10) {
	dir = abs(dir-1) + 1;
}
}