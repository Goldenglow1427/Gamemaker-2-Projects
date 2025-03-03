/// @description Action on the beginning of the summon's activation.
// You can write your code in this editor

if self.com_active_skill != pointer_null
{
	array_push(obj_battle_control.list_action_stack,
		{
			source: self.id,
			action: self.com_active_skill.f_effect_on_active
		}
	);
}

