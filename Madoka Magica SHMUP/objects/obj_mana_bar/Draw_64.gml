/// @description Insert description here
// You can write your code in this editor


var _y_shift = 30;
var _transformed_y = ceil(175*obj_char_ent_player.sanity[obj_char_ent_player.character]/obj_char_ent_player.max_sanity[obj_char_ent_player.character]) + 12;


draw_sprite_ext(spr_mana_icon, -1, 0, 62+_y_shift, 1.6*30/16, 1.6*30/16, 0, c_white, 1);

draw_sprite_ext(spr_manabar_bound, -1, 46, 62+_y_shift, 1, 1, 0, c_white, 1);
draw_sprite_part(spr_manabar_content, -1, 0, 0, _transformed_y, 48, 46, 62+_y_shift);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(144, 86+_y_shift, string("{0}/{1}", obj_char_ent_player.sanity[obj_char_ent_player.character],
	obj_char_ent_player.max_sanity[obj_char_ent_player.character]), 1.5, 1.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
