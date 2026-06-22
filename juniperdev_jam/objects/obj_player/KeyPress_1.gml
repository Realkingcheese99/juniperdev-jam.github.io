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
		if(dir == DIRECTION.RIGHT) {
			xVel = spd;
		} else if(dir == DIRECTION.LEFT) {
			xVel = -spd;
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

if(keyboard_check(vk_down)) {
	room_goto(rmIntroCutscene)
}
