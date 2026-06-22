spd = 5;
initial_jump_vel = 6;
airtime = global.airtime;
xVel = global.xVel;
yVel = 0;
floatiness = 6;
heaviness = 5;
ground_friction = 0.5
air_resistance = 0.05;
grav = 0;
upvel = 0;
airjumps = 0;
grounded = false;
ceiling = false;
hooked = false;
release_modifier = 1/20;
distance = 0;
nearest_hook = 0;
pass1 = false;
pass2 = false;
collision = false;
hooktime = 0;
/*
if(global.start == true) {

}
*/
y = global.playerY;
x = global.playerX;

jumptime = 0;
jumping = false;
onWall = false;
dir = 0;
walljump = false;
swingSpd = 0.15;