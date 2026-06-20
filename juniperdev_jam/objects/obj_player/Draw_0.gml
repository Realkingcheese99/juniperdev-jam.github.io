draw_self();
if(hooked == true) {
	if(collision == false) {
draw_line(x+sprite_width/2,y+sprite_height/2,nearest_hook.x+nearest_hook.sprite_height/2,nearest_hook.y+nearest_hook.sprite_height/2)
draw_circle(nearest_hook.x+nearest_hook.sprite_width/2, nearest_hook.y+nearest_hook.sprite_height/2, distance, 1);
}
}