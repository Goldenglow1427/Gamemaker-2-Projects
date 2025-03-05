/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

self.ef_shield = 1

self.f_use_auto = function()
{
	alarm[2] = 5;
	self.com_done_action = false;
	
	self.com_activate_effect = function()
	{
		obj_battle_control.f_find_enemy_target().f_take_damage({
			type: global.param_damage_phy,
			amount: self.atk
		})
	}
}
self.f_use_skills = [
	// Skill 0.
	function()
	{
		self.alarm[3] = 5;
		self.com_done_action = false;
		
		self.com_activate_effect = function()
		{
			if self.ef_shield != 1
				self.ef_shield++;
		}
	}
];
