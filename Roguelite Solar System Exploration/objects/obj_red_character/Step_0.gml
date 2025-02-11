/// @description Insert description here
// You can write your code in this editor

// Check death.
if self.hitpoint <= 0
{
	obj_winning_display.alarm[0] = 1;
	
	effect_create_above(ef_explosion, x, y, 10, c_white)
	instance_destroy(self)
}