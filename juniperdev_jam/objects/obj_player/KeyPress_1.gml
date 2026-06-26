if(((grounded == true) || (airjumps > 0) || (onWall == true)) && (keyboard_check(vk_space) || keyboard_check(ord("X")))) {
	jumping = true;
	jumptime = 0;
	//airtime = -0.05
	if(grounded == false) {
		airjumps--;
	}
	grounded = false;
	if(onWall == true) {
		walljump = true;
		if(dir == DIRECTION.LEFT) {
			
			leftTime = 0;
		} else {
			
			rightTime = 0;
		}
	}

enum DIRECTION
{
	RIGHT = 1,
	LEFT = 2
}

if(onWall == true) {
	//xVel =-xVel
}
}

