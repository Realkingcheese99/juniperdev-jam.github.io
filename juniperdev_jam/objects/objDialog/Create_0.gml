guiW = display_get_gui_width();
guiH = display_get_gui_height();

dialog = [];
page = -1;
drawnText = "";
wrappedText = "";
currentLine = "";

//box
boxW = guiW*0.7
boxX = (guiW-boxW)/2
boxY = guiH*0.6
boxH = guiH*0.3

currentChar = 0;
typeSpd = 0.5;
textPause = 0;
puncTime = 15;
autoPage = false;
lineBreak = boxW - 15;
breakTrigger = false;


punctuations =
[
	".",
	",",
	"!",
	"?"
]

keystringList =
[
	"L",
	"P"
]

