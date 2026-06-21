image_xscale=width/15;
image_yscale=height/10;
if(type == 0) {
	if(place_meeting(x,y-2,obj_tile)) {
		obj_player.y+=1;
		obj_player.airtime = 1;
	}
} else if(type == 1) {
		if(place_meeting(x,y,obj_tile)) {
		obj_player.y-=3;
	}
}