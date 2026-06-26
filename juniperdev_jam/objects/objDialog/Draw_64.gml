draw_set_halign(fa_left);
draw_set_font(fnt_common);

//--draw textbox--

//main box
draw_set_colour(c_black);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,false);
draw_set_colour(c_white);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,true);


//nametag
if(nameString != "") {
draw_set_colour(c_black);
draw_rectangle(boxX+(4/5)*boxW,boxY-(1/5)*boxH,boxX+boxW,boxY-1,false);
draw_set_colour(c_white);
draw_rectangle(boxX+(4/5)*boxW,boxY-(1/5)*boxH,boxX+boxW,boxY-1,true);
}

//Draw text
if(portraitString = "0") {
draw_text_transformed(boxX + 15, boxY + 5, drawnText,0.3,0.3,0);
} else {
	draw_text_transformed(boxX + 15+220, boxY + 5, drawnText,0.3,0.3,0);
	draw_sprite_ext(asset_get_index(portraitString),0,boxX+10,boxY,4.266,4.266,0,c_white,1);
}
draw_text_transformed(boxX+(4/5)*boxW,boxY-(1/5)*boxH, nameString,0.3,0.3,0);