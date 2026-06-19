if(!place_meeting(x+xVel,y,obj_tile)) {
	x+=xVel;
}
xVel *= (1-friction);

grav = heaviness*airtime;
upvel = floatiness*(1-airtime);
yVel = (grav-upvel);
if(!place_meeting(x,y+2,obj_tile) || jump == true) {
	y+=yVel;
}
jump = false;


if(!place_meeting(x,y+2,obj_tile)) {
	grounded = false;
	airtime += 0.03
} else {
	airtime = 1;
	grounded = true;
}

if(place_meeting(x,y,obj_tile)) {
	y-=5;
}

//show_debug_message(airtime);
//show_debug_message(grounded);