if(((grounded == true) || (airjumps > 0)) && (keyboard_check(vk_space) || keyboard_check(ord("W")))) {
	airtime = -0.1
	if(grounded == false) {
		airjumps--;
	}
	grounded = false;
}


if(keyboard_check(vk_down)) {
	airtime = 2;
}

if(keyboard_check(vk_left)) {
	createDialog
(
[
{
	msg: "Ok, we are testing."
},
{
	msg: "This is typing dialogue to the screen."
},
{
	msg: "The quick brown fox jumps over the lazy dog!"
},
{
	msg: "Notice how there's a textbox too?"
}
]
)
}