/// @description Move on to next turn: deal with actions.
// You can write your code in this editor

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
