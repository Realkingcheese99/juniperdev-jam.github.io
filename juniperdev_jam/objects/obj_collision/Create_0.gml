image_xscale=width/10;
image_yscale=height/10;
if(type == 0) {
	if(place_meeting(x,y,obj_tile)) {
		obj_player.y+=2;
	}
} else if(type == 1) {
		if(place_meeting(x,y,obj_tile)) {
		obj_player.y-=2;
	}
}