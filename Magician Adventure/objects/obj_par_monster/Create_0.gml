/// @description Insert description here
// You can write your code in this editor

selected = false

current_turn = 0

// Base attributes.
hp = def_max_hitpoint
atk = def_attack
res = def_res
sp = def_sp

// List of effects.
ef_dot = []
ef_protection = []
ef_vulnerability = []
ef_enfeeble = []
ef_power = []

// Other Mechanisms.
ef_shield = 0
ef_burn_dmg = 0
ef_burn_active = false
ef_necrosis_dmg = 0
ef_necrosis_active = false
ef_stun = 0

// Methods.
f_find_protection = function()
{
	var ret = 0;
	for(var i=0; i<array_length(ef_protection); i++)
		ret = max(ret, ef_protection[i].amount);
		
	return ret;
}
f_find_vulnerability = function()
{
	var ret = 0;
	for(var i=0; i<array_length(ef_vulnerability); i++)
		ret = max(ret, ef_vulnerability[i].amount);
		
	return ret;
}

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
		val *= (1-self.res/100);
	if dmg.type != global.param_damage_true
		val *= (1-self.f_find_protection()/100);
		
	val *= (1+self.f_find_vulnerability()/100);
	
	for(var i=0; i<array_length(sp); i++)
	{
		if sp[i].type == global.param_sp_def
			sp[i].amount++;
	}
	
	self.hp -= ceil(val);
}
