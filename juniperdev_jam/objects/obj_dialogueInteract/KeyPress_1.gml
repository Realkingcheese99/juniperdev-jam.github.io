if(keyboard_check(ord("Z"))) {
	if(place_meeting(x,y,obj_player)) {
		createDialog(global.dialogue, start, length);
	}
}