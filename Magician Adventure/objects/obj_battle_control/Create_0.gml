/// @description Insert description here
// You can write your code in this editor

card_config = pointer_null
card_effect = pointer_null
card_target = pointer_null

enemy_count = 0

list_target = []

valid_to_cast = false

list_enemy = global.start_battle(
	global.private_list_of_summon,
	global.private_list_of_enemy,
	global.private_list_of_config,
	global.private_list_of_effect
)

instance_deactivate_object(obj_map_control)
instance_deactivate_object(obj_parent_map_node)
