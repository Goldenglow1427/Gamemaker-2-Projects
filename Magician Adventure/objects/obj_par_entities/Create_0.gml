/// @description Insert description here
// You can write your code in this editor

hp_bar_color = c_red
on_selection_color = c_white

selected = false

// Base attributes.
hp = def_max_hp
atk = def_atk
res = def_res

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

// Communication Protocol.
com_done_action = true
com_activate_effect = function()
{
}
def_x = x;
def_y = y;
cur_dir = 1;

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
