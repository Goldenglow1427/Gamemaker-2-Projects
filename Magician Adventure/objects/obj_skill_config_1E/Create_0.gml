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
	show_debug_message("Triggered 1")
	
	array_insert(obj_battle_control.list_target, 0, target)
}
