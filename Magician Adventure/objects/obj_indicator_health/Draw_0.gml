/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white)
draw_text_transformed(35, 516, string(
	"Health: {0}",
	obj_char_player.hp
), 2, 2, 0)
