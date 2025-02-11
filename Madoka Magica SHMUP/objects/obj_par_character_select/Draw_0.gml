/// @description Insert description here
// You can write your code in this editor

var _scale_constant = 1.5;

if global.char_list[par_keybinding-1] == par_character
	image_blend = color_on_selection;
else
	image_blend = color_default;

draw_self();

/*
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(is_selected)
	draw_text_transformed_color(x, y, button_text, _scale_constant, _scale_constant, 0, color_on_selection, color_on_selection, 
		color_on_selection, color_on_selection, image_alpha);
else
	draw_text_transformed_color(x, y, button_text, _scale_constant, _scale_constant, 0, color_default, color_default, 
		color_default, color_default, image_alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
*/