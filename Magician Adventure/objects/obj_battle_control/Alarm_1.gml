/// @description Move on to next turn.
// You can write your code in this editor

// Deal with opponent actions.
for(var i=0; i<instance_number(obj_par_monsters); i++)
{
	var enemy = instance_find(obj_par_monsters, i)
	
	enemy.alarm[0] = 2
}


