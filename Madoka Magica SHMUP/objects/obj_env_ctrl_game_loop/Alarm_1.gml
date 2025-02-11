/// @description Generation of the basic monster

if global.glob_time_stop == false
{
	var _min_distance = 90;
	var _max_distance = 180;

	var _monster_generated_index = irandom_range(1, global.param_monster_gen_chance[game_phase][0]);
	var _monster_generated;

	for(var _i=1; _i<=global.param_monster_gen_type_count; _i++)
		if _monster_generated_index > global.param_monster_gen_chance[game_phase][_i]
			_monster_generated_index -= global.param_monster_gen_chance[game_phase][_i];
		else
		{
			_monster_generated = global.param_monster_gen_type[_i-1];
			break;
		}

	instance_create_layer(
		obj_char_ent_player.x + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		obj_char_ent_player.y + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		"Instances", _monster_generated);
}


if global.game_time <= 30
	alarm[1] = 120; // A new minor monster every 2.0 seconds.
else if global.game_time <= 75
	alarm[1] = 108; // A new minor monster every 1.8 seconds.
else if global.game_time <= 120
	alarm[1] = 90; // A new minor monster every 1.5 seconds.
else if global.game_time <= 180
	alarm[1] = 72; // A new minor monster every 1.2 seconds.
else if global.game_time <= 240
	alarm[1] = 48; // A new minor monster every 0.8 seconds.
else if global.game_time <= 300
	alarm[1] = 36; // A new minor monster every 0.6 seconds.
else
	show_debug_message("ERROR: obj_game_loop time exceeds!");
