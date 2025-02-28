/// @description Insert description here
// You can write your code in this editor

event_inherited()

hp_bar_color = c_red
on_selection_color = c_aqua

// Base attributes.
sp = def_sp

// Methods.
f_take_damage = function(dmg)
{
	var val = dmg.amount;

	if dmg.type != global.param_damage_true
	{
		if self.ef_shield != 0
		{
			self.ef_shield--;
			return;
		}
	}
	
	if dmg.type == global.param_damage_art
		val *= (1-clamp(self.res, 0, 95)/100);
	if dmg.type != global.param_damage_true
		val *= (1-self.f_find_protection()/100);
		
	val *= (1+self.f_find_vulnerability()/100);
	
	for(var i=0; i<array_length(sp); i++)
	{
		if sp[i].type == global.param_sp_def
			sp[i].init++;
	}
	
	self.hp -= ceil(val);
}
f_take_necrosis_damage = function(value)
{
	if self.ef_necrosis_active
		return;
		
	self.ef_necrosis_dmg += value;
}
f_take_burn_damage = function(value)
{
	if self.ef_burn_active
		return;
		
	self.ef_burn_dmg += value;
}

f_use_auto = function()
{
	// Requires implementation.
}
f_use_skills = [] // List of skills on activation.
