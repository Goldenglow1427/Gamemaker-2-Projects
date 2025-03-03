/// @description Insert description here
// You can write your code in this editor

if obj_button_confirm_cast.is_active or obj_battle_control.on_player_turn == false
	is_active = false
else
	is_active = true
	
// show_debug_message(string("is_active: {0}", is_active))
	
if is_active
	image_blend = c_white
else
	image_blend = c_grey
