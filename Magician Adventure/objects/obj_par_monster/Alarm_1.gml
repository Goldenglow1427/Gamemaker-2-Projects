/// @description Reaction on the beginning of own main phase.
// You can write your code in this editor

array_insert(obj_battle_control.list_action_stack, 0,
	{
		source: self.id,
		action: f_use_auto
	}
);

// By default, sp should be a list.
for(var i=0; i<array_length(sp); i++)
{	
	if sp[i].init >= sp[i].amount
	{
		sp[i].init = 0;
		array_insert(obj_battle_control.list_action_stack, 0,
			{
				source: self.id,
				action: f_use_skills[i]
			}
		);
	}
	else if sp[i].type == global.param_sp_auto
		sp[i].init++;
}
