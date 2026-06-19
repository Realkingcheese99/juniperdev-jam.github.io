if(keyboard_check_released(ord("F"))) {
	hooked = false;
	airtime = -((sqrt(sqr(dx)+sqr(dy)))*cos(hookAngle) + floatiness)/(heaviness+floatiness)*1/10;
	xVel = (sqrt(sqr(dx)+sqr(dy)))*sin(hookAngle)*1/30;
	
}
//show_debug_message("test")