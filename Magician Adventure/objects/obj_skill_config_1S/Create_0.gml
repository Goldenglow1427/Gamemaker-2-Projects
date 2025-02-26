/// @description To create this variable.

event_inherited()

check_valid = function(target)
{
	if object_is_ancestor(target.object_index, obj_par_monster)
		return true
	else
		return false
}

take_effect = function(target)
{
	// show_debug_message("Triggered")
	
	var inst_id = -1;
	for(var i=0; i<array_length(obj_battle_control.list_enemy); i++)
		if target == obj_battle_control.list_enemy[i]
		{
			inst_id = i;
			break
		}
		
	if inst_id == -1
	{
		show_debug_message("Failed to find target in OBJ_SKILL_CONFIG_1S")
		game_end(-1)
	}
	
	array_insert(obj_battle_control.list_target, 0, target)
	
	for(var i=inst_id-1; i>=0; i--)
		if instance_exists(obj_battle_control.list_enemy[i])
		{
			array_insert(obj_battle_control.list_target, 0, obj_battle_control.list_enemy[i])
			break
		}
		
	for(var i=inst_id+1; i<array_length(obj_battle_control.list_enemy); i++)
		if instance_exists(obj_battle_control.list_enemy[i])
		{
			array_insert(obj_battle_control.list_target, 0, obj_battle_control.list_enemy[i])
			break
		}
}
