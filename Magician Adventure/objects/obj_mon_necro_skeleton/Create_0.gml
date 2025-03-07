/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

self.f_use_auto = function()
{
	alarm[global.param_motion_down] = 5;
	self.com_done_action = false;
	
	self.com_activate_effect = function()
	{
		var tar = obj_battle_control.f_find_enemy_target();
		
		tar.f_take_damage({
			type: global.param_damage_phy,
			amount: self.atk
		})
		
		if instance_exists(tar)
			tar.f_take_necrosis_damage(2)
	}
}