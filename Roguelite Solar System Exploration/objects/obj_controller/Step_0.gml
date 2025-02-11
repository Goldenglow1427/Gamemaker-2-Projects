/// @description Insert description here
// You can write your code in this editor

if char1 != pointer_null && char2 != pointer_null
{
	show_debug_message("HAHA")
	
	global.single_target = obj_red_character
		
	char1.trigger()
	
	global.single_target = pointer_null
	char1 = pointer_null
	char2 = pointer_null
	
	global.atk_buff = 0
	
	if instance_exists(obj_buff_cards)
		obj_buff_cards.alarm[0] = 1;
}
