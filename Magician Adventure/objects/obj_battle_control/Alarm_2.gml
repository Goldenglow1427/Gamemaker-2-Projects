/// @description Move on to next turn: deal with actions.
// You can write your code in this editor

if com_actions_sorted == false
{
	array_sort(self.list_action_stack, function(e1, e2)
	{
		var t1 = 0;
		var t2 = 0;
		
		if object_is_ancestor(e1.source.object_index, obj_par_summons)
			t1 = 1;
		if object_is_ancestor(e2.source.object_index, obj_par_summons)
			t2 = 1;
		
		if t1 != t2
			return t1 > t2;
		else
		{
			return e1.source.x < e2.source.x;
		}
	});
	
	com_actions_sorted = true;
}

if com_current_actor != pointer_null && com_current_actor.com_done_action == false
{
	alarm[2] = 2;
	return;
}

if(array_length(self.list_action_stack) != 0)
{
	var tmp = array_pop(self.list_action_stack);
	
	com_current_actor = tmp.source;
	tmp.action();
	
	alarm[2] = 2;
}
else
	alarm[3] = 2;
