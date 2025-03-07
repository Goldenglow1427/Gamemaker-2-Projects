/// @description Insert description here
// You can write your code in this editor

var _start_x = 60;
var _start_y = 30;

var _rect_x = 139;
var _rect_y0 = 12;
var _rect_y1 = 47;

draw_sprite(spr_health_icon, 0, _start_x, _start_y)
draw_sprite(spr_health_bar, 0, _start_x, _start_y)

draw_set_color(c_red)
draw_rectangle(65, _rect_y0,
	65+(obj_char_player.hp / obj_char_player.max_hp) * _rect_x, _rect_y1,
false)

global.set_draw_center()
draw_set_color(c_white)
draw_text_transformed(65+70, _start_y, string("{0} / {1}", obj_char_player.hp, obj_char_player.max_hp), 1.5, 1.5, 0)
global.set_draw_left()



