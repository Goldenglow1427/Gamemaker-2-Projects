/// @description Insert description here
// You can write your code in this editor

hitpoint = par_max_hitpoint;

immobilized = false;
slowed_rate = 0.0;
speed_buff = 0.0;

speed_buff_sayaka = 1.0;

invulnerability = 0;


/// @function						on_damage(_damage_value)
/// @description					Triggers when damage is dealt to this entity.

function on_damage(_damage_value)
{
	if invulnerability
		return;
	
	hitpoint -= _damage_value;
	invulnerability++;
	
	if hitpoint <= 0
	{
		effect_create_above(ef_firework, x, y, 0.6, c_white);
		alarm[3] = 3;
	}
	else
	{
		effect_create_above(ef_spark, x, y, 1, c_white);
		alarm[10] = 10;
	}
}

