//initial player spawning
global.playerX = 30;
global.playerY = 126;
global.airtime = 1;
global.xVel = 0;
//dialogue from file
global.dialogue = [];
var i = 0;
var file = "dialogue.json";

if(file_exists(file)) {
var buffer = buffer_load(file);
var jsonDialogue = buffer_read(buffer, buffer_string);
buffer_delete(buffer);


global.dialogue = json_parse(jsonDialogue);
}
global.interact = 0;