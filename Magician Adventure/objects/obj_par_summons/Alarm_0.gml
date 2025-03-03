/// @description Action on the beginning of a turn.
// You can write your code in this editor

com_active_skill = false;

self.taunt = def_taunt + irandom_range(
	0-def_taunt_variance, def_taunt_variance);
	
self.f_set_active_skill(pointer_null)
