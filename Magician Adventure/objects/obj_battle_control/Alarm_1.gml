/// @description Move on to next turn - load all actions.
// You can write your code in this editor

self.on_player_turn = false;

// Add all opponent actions into the list.
for(var i=0; i<instance_number(obj_par_monster); i++)
{
	var enemy = instance_find(obj_par_monster, i)
	
	enemy.alarm[1] = 2;
}

// Add all friendly actions into the list.
for(var i=0; i<instance_number(obj_par_summons); i++)
{
	var summon = instance_find(obj_par_summons, i)
	
	summon.alarm[1] = 2;
}

self.alarm[2] = 10;
