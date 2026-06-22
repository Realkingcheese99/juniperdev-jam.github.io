if(keyboard_check_released(ord("F"))) {
	if(collision == false) {
	if(hooked == true) {
	if(distance <= 200) {
	hooked = false;
	airtime = ((distance)*sin(hookAngle) + floatiness)/(heaviness+floatiness)*release_modifier;
	show_debug_message(hooktime);
	xVel = -sign(dx)*(distance)*cos(hookAngle)*release_modifier*2;
	}
	}
}
}