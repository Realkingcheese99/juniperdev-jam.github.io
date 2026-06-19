

//y velocity calculations
grav = heaviness*airtime;
upvel = floatiness*(1-airtime);
yVel = (grav-upvel);



// --collision

//hitting head
if(place_meeting(x,y-4,obj_tile)) {
	ceiling = true;
	y+=4;
	airtime = 1;
} else {
	ceiling = false;
}
//jumping
if((!place_meeting(x,y+4,obj_tile) && ceiling == false) || grounded == false) {
	y+=yVel;
}
//horizontal
if(!place_meeting(x+xVel,y-1,obj_tile)) {
	x+=xVel;
} else {
}
//landing
if(!place_meeting(x,y+4,obj_tile)) {
	grounded = false;
	airtime += 0.03
} else {
	airtime = 1;
	grounded = true;
	airjumps = 1;
}

//getting unstuck vertically
if(place_meeting(x,y,obj_tile) && ceiling == false) {
	y-=5;
}

//friction
xVel *= (1-friction);

//testing, brings player back to spawn when falling off
if(y>room_height) {
	y = 416
	x = 736
}

//show_debug_message(airjumps);
//show_debug_message(airtime);