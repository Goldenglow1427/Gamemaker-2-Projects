/// @description Time settings
// You can write your code in this editor

if global.glob_time_stop == false
	global.game_time++;

alarm[0] = 60;

if global.game_time <= 30
	game_phase = 0;
else if global.game_time <= 75
	game_phase = 1;
else if global.game_time <= 120
	game_phase = 2;
else if global.game_time <= 180
	game_phase = 3;
else if global.game_time <= 240
	game_phase = 4;
else if global.game_time <= 300
	game_phase = 5;
