/// @description To create this variable.

event_inherited()

check_valid = function(target)
{
	if target == pointer_null
		return true
	else
		return false
}

take_effect = function(target)
{
	// show_debug_message("Triggered")
	
	var obj_count = 0;
	var len = array_length(obj_battle_control.list_enemy);
	for(var i=0; i<len; i++)
		if instance_exists(obj_battle_control.list_enemy[i])
			obj_count += 1;
	
	// show_debug_message(string("Obj count: {0}", obj_count))
	
	if obj_count > 2
	{
		var target_count = 0;
		
		while(target_count < 2)
		{
			var tar_id = irandom_range(0, len-1);
			
			if instance_exists(obj_battle_control.list_enemy[tar_id]) == false
				continue
			if array_contains(obj_battle_control.list_target, obj_battle_control.list_enemy[tar_id])
				continue
				
			array_insert(obj_battle_control.list_target, 0, obj_battle_control.list_enemy[tar_id])
			target_count++
			
			// show_debug_message(string("Current targets: {0}", target_count))
		}
	}
	else
	{
		for(var i=0; i<len; i++)
			if instance_exists(obj_battle_control.list_enemy[i])
				array_insert(obj_battle_control.list_target, 0, obj_battle_control.list_enemy[i])
	}
}
