guiW = display_get_gui_width();
guiH = display_get_gui_height();

dialog = [];
page = -1;
drawnText = "";
wrappedText = "";
currentLine = "";

currentChar = 0;
typeSpd = 0.5;
textPause = 0;
puncTime = 15;
autoPage = false;
lineBreak = guiW * 0.8;
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