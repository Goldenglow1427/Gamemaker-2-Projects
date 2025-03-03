/// @description Reaction on the beginning of own main phase.
// You can write your code in this editor

// By default, sp should be a list.
for(var i=0; i<array_length(sp); i++)
{	
	if sp[i].init >= sp[i].amount
	{
		sp[i].init = 0;
		array_push(obj_battle_control.list_action_stack,
			{
				source: self.id,
				action: f_use_skills[i]
			}
		);
	}
	else if sp[i].type == global.param_sp_auto
		sp[i].init++;
}

array_push(obj_battle_control.list_action_stack,
	{
		source: self.id,
		action: f_use_auto
	}
);
