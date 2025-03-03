/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

f_effect_on_active = function()
{
	self.parent_object.alarm[3] = 2;
	self.parent_object.com_done_action = false;
	
	self.parent_object.com_activate_effect = function()
	{
		self.parent_object.taunt += 10;
	}
}
