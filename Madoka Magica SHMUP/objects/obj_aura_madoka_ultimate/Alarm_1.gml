/// @description Shoot towards the closest enemy.
// You can write your code in this editor

if instance_number(obj_par_monster) > 0
{
	for(var _i=1; _i<=global.stat_madoka_ult_max_arrow; _i++)
		instance_create_layer(x, y, "Instances", obj_madoka_ultimate_bullet);
}

alarm[1] = 15;
