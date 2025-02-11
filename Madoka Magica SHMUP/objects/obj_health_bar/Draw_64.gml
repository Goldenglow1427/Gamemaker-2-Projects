/// @description Insert description here
// You can write your code in this editor

var _y_shift = 30;

draw_sprite_ext(spr_health_icon, -1, 0, 8+_y_shift, 1.6*29/16, 1.6*29/16, 0, c_white, 1);

draw_sprite_ext(sprite_index, -1, 46, 8+_y_shift, 1, 1, 0, c_white, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(144, 32+_y_shift, string("{0}/6", obj_char_ent_player.hitpoint), 1.5, 1.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
