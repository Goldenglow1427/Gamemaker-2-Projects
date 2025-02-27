/// @description Insert description here
// You can write your code in this editor

// Check death.
if self.hp <= 0
	alarm[10] = 1

if self.selected
	image_blend = c_aqua
else
	image_blend = c_white

// Check necrosis damage.
if ef_necrosis_dmg >= 10
{
	self.ef_necrosis_dmg = 0;
	self.ef_necrosis_active = true;
	
	self.f_take_damage({
		type: global.param_damage_true,
		amount: 15
	})
	
	for(var i=0; i<array_length(self.sp); i++)
		self.sp[i].init = 0;
}
if ef_burn_dmg >= 10
{
	self.ef_burn_dmg = 0;
	self.ef_burn_active = true;
	
	self.f_take_damage({
		type: global.param_damage_art,
		amount: 30
	})
}
