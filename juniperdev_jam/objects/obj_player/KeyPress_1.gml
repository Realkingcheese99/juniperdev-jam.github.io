if(((grounded == true) || (airjumps > 0)) && (keyboard_check(vk_space) || keyboard_check(ord("W")))) {
	airtime = -0.1
	if(grounded == false) {
		airjumps--;
	}
	grounded = false;
}

