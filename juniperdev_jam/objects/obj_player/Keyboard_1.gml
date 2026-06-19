if(keyboard_check(ord("A")) && abs(xVel)<=spd) {
	xVel = -spd;
} else if(keyboard_check(ord("D")) && abs(xVel)<=spd) { 
	xVel = spd;
}
if(keyboard_check(ord("F"))) {
	hooked = true;
	dx = (x-obj_hook.x)
	dy = (y-obj_hook.y)
	distance = sqrt(sqr(dx)+sqr(dy));
	hookAngle = arctan(dx/dy);
	show_debug_message(radtodeg(hookAngle));
}