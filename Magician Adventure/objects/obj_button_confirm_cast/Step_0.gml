/// @description Insert description here
// You can write your code in this editor

is_active = obj_battle_control.valid_to_cast and obj_battle_control.on_player_turn

if is_active
	image_alpha = 1
else
	image_alpha = 0
