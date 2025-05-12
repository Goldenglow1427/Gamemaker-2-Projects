/// @description Insert description here
// You can write your code in this editor

if global.char_list[0] == global.char_index.homura || 
	global.char_list[1] == global.char_index.homura ||
	global.char_list[0] == global.char_index.mami ||
	global.char_list[1] == global.char_index.mami
	show_message("Please don't choose a character that's not developed yet!");
else if global.char_list[0] != global.char_list[1]
	room_goto(rm_maingame);
else
{
	show_message("You must choose two different characters to begin!");
}
