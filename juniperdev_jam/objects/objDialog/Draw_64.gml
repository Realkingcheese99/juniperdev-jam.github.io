draw_set_halign(fa_left);
draw_set_font(fnt_common);

//draw textbox
draw_set_colour(c_black);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,false);
draw_set_colour(c_white);
draw_rectangle(boxX,boxY,boxX+boxW,boxY+boxH,true);

//Draw text
draw_text(boxX + 15, boxY + 5, drawnText);