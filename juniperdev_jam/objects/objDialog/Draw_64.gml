draw_set_halign(fa_left);
draw_set_font(fnt_common);

//draw textbox
draw_set_colour(c_black);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,false);
draw_set_colour(c_white);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,true);

//Draw text
if(portraitString = "0") {
draw_text(boxX + 15, boxY + 5, drawnText);
} else {
	draw_text(boxX + 15+256, boxY + 5, drawnText);
	draw_sprite_ext(asset_get_index(portraitString),0,boxX+15,boxY+5,4.266,4.266,0,c_white,1);
}