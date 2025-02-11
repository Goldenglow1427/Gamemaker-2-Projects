/// @description Insert description here
// You can write your code in this editor


var _transformed_x = ceil(689*global.game_time/300) + 5;

draw_sprite_ext(spr_game_duration_bar, -1, 50, 10, 1, 1, 0, c_white, 1);
draw_sprite_part(spr_game_duration_content, -1, 0, 0, _transformed_x, 20, 50, 10);

