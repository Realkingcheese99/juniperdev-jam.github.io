if(keyboard_check(ord("A")) && abs(xVel)<=spd) {
	xVel = -spd;
} else if(keyboard_check(ord("D")) && abs(xVel)<=spd) { 
	xVel = spd;
}

if(keyboard_check_pressed(ord("F"))) {
	nearest_hook = instance_nearest(x+sprite_width/2,y+sprite_width/2,obj_hook);
	dx = (x+sprite_width/2-(obj_hook.x+obj_hook.sprite_width/2))
	dy = (y+sprite_height/2-(obj_hook.y+obj_hook.sprite_height/2))
	hookAngle = arctan((dx/dy));
	distance = sqrt(sqr(dx)+sqr(dy));
	release_modifier = distance/5000+0.03;
}

if(keyboard_check(ord("F"))) {
	if(distance <=200) {
	hooked = true;
	hookAngle-=0.15;
	x=obj_hook.x+obj_hook.sprite_width/2+sign(dx)*distance*cos(hookAngle)-sprite_width/2
	y=obj_hook.y+obj_hook.sprite_height/2-distance*sin(hookAngle)-sprite_height/2
	}
}
