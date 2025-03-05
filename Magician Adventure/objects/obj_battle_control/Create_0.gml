/// @description Insert description here
// You can write your code in this editor

current_round = 1;

card_config = pointer_null
card_effect = pointer_null
card_target = pointer_null

enemy_count = 0

list_target = []

valid_to_cast = false

// Check if currently the player can do anything.
on_player_turn = true

tmp_return_value = global.start_battle(
	global.private_list_of_summon,
	global.private_list_of_enemy,
	global.private_list_of_config,
	global.private_list_of_effect
)
list_enemy = tmp_return_value[0];
list_summon = tmp_return_value[1];

instance_deactivate_object(obj_map_control)
instance_deactivate_object(obj_parent_map_node)

list_action_stack = []
com_current_actor = pointer_null
com_actions_sorted = false

self.alarm[4] = 10;

f_list_friendly_target = list_enemy
f_list_enemy_target = list_summon
array_push(f_list_enemy_target, instance_find(obj_char_player, 0));

f_find_enemy_target = function()
{
	array_sort(f_list_enemy_target, function(ins1, ins2)
	{
		if ins1.taunt < ins2.taunt
			return true;
		else
			return false;
	})
	
	return f_list_enemy_target[0];
}
f_find_friendly_target = function()
{
	array_sort(f_list_friendly_target, function(ins1, ins2)
	{
		if ins1.taunt > ins2.taunt
			return true;
		else
			return false;
	})
	
	return f_list_friendly_target[0];
}
