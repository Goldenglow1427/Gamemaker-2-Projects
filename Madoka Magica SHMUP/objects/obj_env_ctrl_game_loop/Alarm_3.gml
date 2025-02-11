/// @description Generation of the inspirer monster

if global.glob_time_stop == false
{
	var _min_distance = 80;
	var _max_distance = 160;

	var _monster_generated_index = irandom_range(1, global.param_inspirer_gen_chance[game_phase][0]);
	var _monster_generated;

	for(var _i=1; _i<=global.param_inspirer_gen_type_count; _i++)
		if _monster_generated_index > global.param_inspirer_gen_chance[game_phase][_i]
			_monster_generated_index -= global.param_inspirer_gen_chance[game_phase][_i];
		else
		{
			_monster_generated = global.param_inspirer_gen_type[_i-1];
			break;
		}

	instance_create_layer(
		obj_char_ent_player.x + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		obj_char_ent_player.y + irandom_range(_min_distance, _max_distance) * (irandom_range(0, 1)*2-1),
		"Instances", _monster_generated);
}


if global.game_time <= 30
	alarm[3] = 1200; // A new minor monster every 20.0 seconds.
else if global.game_time <= 75
	alarm[3] = 900; // A new minor monster every 15.0 seconds.
else if global.game_time <= 120
	alarm[3] = 600; // A new minor monster every 10.0 seconds.
else if global.game_time <= 180
	alarm[3] = 480; // A new minor monster every 8.0 seconds.
else if global.game_time <= 240
	alarm[3] = 360; // A new minor monster every 6.0 seconds.
else if global.game_time <= 300
	alarm[3] = 300; // A new minor monster every 5.0 seconds.

