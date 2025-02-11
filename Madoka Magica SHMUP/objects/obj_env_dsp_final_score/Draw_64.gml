/// @description Insert description here
// You can write your code in this editor

var _dist_between_text = 35;
var _data_initial_pos = 95;

var _total_point = 
	10 * global.var_char_count_basic_monster
+	12 * global.var_char_count_boost_monster
+	30 * global.var_char_count_large_monster
+	15 * global.var_char_count_boost_monster
+	20 * global.var_char_count_fast_monster;


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(400, 55,
	"GAME OVER",
	3, 3, 0
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_text_transformed(10, _data_initial_pos,
	string("Basic Monster Killed    {0}", global.var_char_count_basic_monster),
	1.5, 1.5, 0
);

draw_text_transformed(10, _data_initial_pos + _dist_between_text,
	string("Fast Monster Killed     {0}", global.var_char_count_fast_monster),
	1.5, 1.5, 0
);

draw_text_transformed(10, _data_initial_pos + _dist_between_text * 2,
	string("Large Monster Killed    {0}", global.var_char_count_large_monster),
	1.5, 1.5, 0
);

draw_text_transformed(10, _data_initial_pos + _dist_between_text * 3,
	string("Ranged Monster Killed   {0}", global.var_char_count_range_monster),
	1.5, 1.5, 0
);

draw_text_transformed(10, _data_initial_pos + _dist_between_text * 4,
	string("Boost Monster Killed    {0}", global.var_char_count_boost_monster),
	1.5, 1.5, 0
);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed_color(390, _data_initial_pos + _dist_between_text * 7,
	string("Total Score    {0}", _total_point),
	2.5, 2.5, 0,
	global.color_madoka, global.color_mami, global.color_sayaka, global.color_kyoko, 1
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);