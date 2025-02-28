/// @description Insert description here
// You can write your code in this editor

event_inherited();

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
	self.res -= 20;
}
