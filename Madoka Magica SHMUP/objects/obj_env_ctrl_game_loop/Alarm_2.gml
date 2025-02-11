/// @description Generation of the shooter monster

if global.glob_time_stop == false
{
	var _min_distance = 120;
	var _max_distance = 200;

	var _monster_generated_index = irandom_range(1, global.param_shooter_gen_chance[game_phase][0]);
	var _monster_generated;

	for(var _i=1; _i<=global.param_shooter_gen_type_count; _i++)
		if _monster_generated_index > global.param_shooter_gen_chance[game_phase][_i]
			_monster_generated_index -= global.param_shooter_gen_chance[game_phase][_i];
		else
		{
			_monster_generated = global.param_shooter_gen_type[_i-1];
			break;
		}

	instance_create_layer(
		obj_char_ent_player.x + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		obj_char_ent_player.y + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		"Instances", _monster_generated);
}


if global.game_time <= 30
	alarm[2] = 360; // A new minor monster every 6.0 seconds.
else if global.game_time <= 75
	alarm[2] = 300; // A new minor monster every 5.0 seconds.
else if global.game_time <= 120
	alarm[2] = 240; // A new minor monster every 4.0 seconds.
else if global.game_time <= 180
	alarm[2] = 150; // A new minor monster every 2.5 seconds.
else if global.game_time <= 240
	alarm[2] = 180; // A new minor monster every 3.0 seconds.
else if global.game_time <= 300
	alarm[2] = 135; // A new minor monster every 2.25 seconds.

