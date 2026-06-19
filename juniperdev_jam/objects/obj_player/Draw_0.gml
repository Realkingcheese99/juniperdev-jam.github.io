draw_self();
if(hooked == true) {
draw_line(x+sprite_width/2,y+sprite_height/2,obj_hook.x+obj_hook.sprite_height/2,obj_hook.y+obj_hook.sprite_height/2)
draw_circle(obj_hook.x+obj_hook.sprite_width/2, obj_hook.y+obj_hook.sprite_height/2, distance, 1);
}