draw_self();
if(hooked == true) {
	if(collision == false) {
		draw_set_colour(c_white);
draw_line(x,y,nearest_hook.x+nearest_hook.sprite_height/2,nearest_hook.y+nearest_hook.sprite_height/2)
draw_circle(nearest_hook.x+nearest_hook.sprite_width/2, nearest_hook.y+nearest_hook.sprite_height/2, distance, 1);
}
}