/// @description Insert description here
// You can write your code in this editor

var _start_x = 300;
var _start_y = 30;

var _rect_x = 139;
var _rect_y0 = 12;
var _rect_y1 = 47;

draw_sprite(spr_memory_shards_icon, 0, _start_x, _start_y)

global.set_draw_center()
draw_set_color(c_ltgray)
draw_text_transformed(_start_x+20, _start_y, string("{0}", obj_char_player.shards), 2.3, 2.3, 0)
global.set_draw_left()



