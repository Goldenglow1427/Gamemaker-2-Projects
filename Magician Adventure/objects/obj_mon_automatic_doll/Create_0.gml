/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

self.f_use_auto = function()
{
	if obj_battle_control.current_round >= 4
	{
		alarm[2] = 5;
		self.com_done_action = false;
	
		self.com_activate_effect = function()
		{
			obj_char_player.f_take_damage({
				type: global.param_damage_phy,
				amount: self.atk
			})
		}
	}
}
self.f_use_skills = [
	// Skill 0.
	function()
	{
		self.alarm[2] = 5;
		self.com_done_action = false;
		
		self.com_activate_effect = function()
		{
			if obj_battle_control.current_round < 4
			{
				obj_char_player.f_take_damage({
					type: global.param_damage_phy,
					amount: self.atk
				})
			}
		}
	}
];
