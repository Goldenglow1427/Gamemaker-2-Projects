/// @description Move on to next turn.
// You can write your code in this editor

// Deal with opponent actions.
for(var i=0; i<instance_number(obj_par_monster); i++)
{
	var enemy = instance_find(obj_par_monster, i)
	
	enemy.alarm[0] = 2
}

for(var i=0; i<instance_number(obj_par_summons); i++)
{
	var summon = instance_find(obj_par_summons, i)
	
	summon.alarm[0] = 2
}
