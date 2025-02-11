/// @description Insert description here
// You can write your code in this editor

event_inherited();

if is_casting_spell
	speed = 0;

if image_index >= 4.75
{
	instance_create_layer(x, y, "Auras", obj_mon_aura_inspire_haste);
	image_speed = 0;
	
	image_index = 0;
	
	alarm[2] = irandom_range(360, 600);
	is_casting_spell = false;
}

