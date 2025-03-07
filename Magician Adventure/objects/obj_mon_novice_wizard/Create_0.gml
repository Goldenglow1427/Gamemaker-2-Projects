/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

self.ef_shield = 1

self.f_use_auto = function()
{
	alarm[global.param_motion_down] = 5;
	self.com_done_action = false;
	
	self.com_activate_effect = function()
	{
		obj_battle_control.f_find_enemy_target().f_take_damage({
			type: global.param_damage_art,
			amount: self.atk
		})
	}
}
self.f_use_skills = [
	// Skill 0.
	function()
	{
		self.alarm[global.param_motion_up] = 5;
		self.com_done_action = false;
		
		var rnd = irandom_range(1, 2)
		self.com_activate_effect = pointer_null;
		
		if rnd == 1
		{
			self.com_activate_effect = function()
			{
				obj_battle_control.f_find_enemy_target().f_take_damage({
					type: global.param_damage_art,
					amount: self.atk*1.5
				})
			}
		}
		else if rnd == 2
		{
			self.com_activate_effect = function()
			{
				array_insert(
					obj_battle_control.f_find_enemy_target().ef_vulnerability,
					0,
					{
						turn: 2,
						amount: 50,
						type: global.param_damage_phy
					}
				)
				array_insert(
					obj_battle_control.f_find_enemy_target().ef_vulnerability,
					0,
					{
						turn: 2,
						amount: 50,
						type: global.param_damage_art
					}
				)
			}
		}
	}
];
