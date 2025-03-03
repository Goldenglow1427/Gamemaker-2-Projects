/// @description Triggered on the beginning of a turn.
// You can write your code in this editor

for(var i=0; i<array_length(list_summon); i++)
	if instance_exists(list_summon[i])
	{
		list_summon[i].alarm[0] = 3;
	}

com_actions_sorted = false
on_player_turn = true
