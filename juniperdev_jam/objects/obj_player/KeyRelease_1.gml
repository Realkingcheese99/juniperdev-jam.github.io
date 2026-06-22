if(global.interact == 0) {
if(keyboard_check_released(vk_space)) {
	if(walljump == true) {
		dir *= -1;
	}
	jumping = false;
}

if(keyboard_check_released(ord("F"))) {
	if(collision == false) {
	if(hooked == true) {
	if(distance <= 200) {
	hooked = false;
	airtime = ((distance)*sin(hookAngle) + floatiness)/(heaviness+floatiness)*release_modifier;
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
}