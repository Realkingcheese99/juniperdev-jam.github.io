if(keyboard_check_released(vk_space)) {
	jumping = false;
	walljump = false;
}

if(keyboard_check_released(ord("F"))) {
	if(collision == false) {
	if(hooked == true) {
	if(distance <= 200) {
	hooked = false;
	airtime = -(floatiness + distance*cos(hookAngle))/(heaviness+floatiness);
	airtime *= release_modifier;
	show_debug_message($"airtime: {airtime}, yVel:  {heaviness*airtime-floatiness*(1-airtime)}");
	//airtime = (cos(hookAngle) + floatiness)/(heaviness+floatiness)*release_modifier;
	//show_debug_message(hooktime);
	xVel = sign(x-nearest_hook.x)*(distance)*cos(hookAngle)*release_modifier*10;
	show_debug_message(cos(hookAngle)*distance);
	if(cos(hookAngle) >0 ) {
		//leftTime = sin(hookAngle)*distance
	}
	}
	}
}
}