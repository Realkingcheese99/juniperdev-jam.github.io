if(global.interact ==0){
if(((grounded == true) || (airjumps > 0) || (onWall == true)) && (keyboard_check(vk_space) || keyboard_check(ord("W")))) {
	jumping = true;
	jumptime = 0;
	//airtime = -0.05
	if(grounded == false) {
		airjumps--;
	}
	grounded = false;
	if(onWall == true) {
		walljump = true;
		if(dir == -1) {
			leftTime = 0;
		} else {
			rightTime = 0;
		}
	}

if(onWall == true) {
	//xVel =-xVel
}
}

if(keyboard_check(vk_down)) {
	airtime = 2;
}
}