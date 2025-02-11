/// @description Insert description here
// You can write your code in this editor

image_alpha = hitpoint / par_max_hitpoint;

// Action: move towards the character.
if immobilized || global.glob_time_stop
	speed = 0;
else
	speed = par_basic_speed * (1 - slowed_rate) * (1 + speed_buff) * speed_buff_sayaka;
direction = point_direction(x, y, obj_char_ent_player.x, obj_char_ent_player.y);

