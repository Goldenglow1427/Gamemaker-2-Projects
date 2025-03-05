/// @description Insert description here
// You can write your code in this editor

hp = 70;
max_hp = 70;
shards = 6;
experience = 0;

taunt = def_taunt

combat_mana = 5;
combat_max_mana = 5;

ef_shield = 0;
ef_burn_dmg = 0;
ef_burn_active = false;
ef_necrosis_dmg = 0;
ef_necrosis_active = false;
ef_stun = 0;

// List of effects.
ef_protection = [];
ef_vulnerability = [];
ef_enfeebleness = [];
ef_power = [];

// Methods.
f_turn_reset = function()
{
	if self.combat_mana < self.combat_max_mana
		self.combat_mana = self.combat_max_mana;
}

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
	
	if dmg.type != global.param_damage_true
		val *= (1-self.f_find_protection()/100);
		
	val *= (1+self.f_find_vulnerability()/100);
	
	self.hp -= ceil(val);
}
