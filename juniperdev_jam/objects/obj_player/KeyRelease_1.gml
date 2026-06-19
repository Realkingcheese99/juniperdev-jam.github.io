if(keyboard_check_released(ord("F"))) {
	if(distance <= 200) {
	hooked = false;
	airtime = ((distance)*cos(hookAngle) + floatiness)/(heaviness+floatiness)*release_modifier;
	show_debug_message(cos(hookAngle));
	xVel = sign(dx)*(distance)*sin(hookAngle)*release_modifier*2;
	}
}