if(!place_meeting(x,y,obj_player)) {
	touching = false;
} else if(touching == false) {
	//show_debug_message(room);
	global.playerY = obj_player.y;
	global.airtime = obj_player.airtime;
	global.xVel = obj_player.xVel;
	if(x>room_width/2) {
	global.playerX = 5;
	room_goto_next();
	} else {
		global.playerX = 315
		room_goto_previous();
	}
}
