/// @description Insert description here
// You can write your code in this editor

DEBUG_MODE = false;

// Setting the random seeds.
if DEBUG_MODE
{
	show_debug_log(true)
	random_set_seed(0)
}
else
{
	random_set_seed(current_second * 114
		+ current_minute * 514
		+ current_hour * 1919
		+ current_day * 810
		+ current_month * 1234
		+ current_year * 5678);
}

global.private_list_of_enemy = []
global.private_list_of_config = []
global.private_list_of_effect = []
global.private_list_of_summon = []
global.record_battle_data = function(list_of_summon, list_of_enemy, list_of_config, list_of_effect)
{
	global.private_list_of_enemy = list_of_enemy
	global.private_list_of_config = list_of_config
	global.private_list_of_effect = list_of_effect
	global.private_list_of_summon = list_of_summon
}

global.start_battle = function(list_of_summon, list_of_enemy, list_of_config, list_of_effect)
{	
	// room_goto(rm_main_battle_page)
	var ret_list_of_enemy = []
	
	if array_length(list_of_config) > 5 or array_length(list_of_enemy) > 5
	{
		show_debug_message("Error in setting up battle - too many skills equipped.")
	}
	
	obj_battle_control.enemy_count = array_length(list_of_enemy)
	for(var i=0; i<obj_battle_control.enemy_count; i++)
	{
		array_insert(ret_list_of_enemy, 0, instance_create_layer(640-75*(obj_battle_control.enemy_count-1)+i*150, 228, "Opponents", list_of_enemy[i]));
	}
	
	obj_battle_control.summon_count = array_length(list_of_summon)
	for(var i=0; i<obj_battle_control.summon_count; i++)
	{
		instance_create_layer(640-75*(obj_battle_control.summon_count-1)+i*150, 600, "Opponents", list_of_summon[i]);
	}
	
	for(var i=0; i<5; i++)
	{
		if i >= array_length(list_of_config)
			instance_create_layer(416-96*i, 640, "Buttons", obj_skill_interface);
		else
			instance_create_layer(416-96*i, 640, "Buttons", list_of_config[i]);
	}
	for(var i=0; i<5; i++)
	{
		if i >= array_length(list_of_effect)
			instance_create_layer(800+96*i, 640, "Buttons", obj_skill_interface);
		else
			instance_create_layer(800+96*i, 640, "Buttons", list_of_effect[i]);
	}
	
	return ret_list_of_enemy;
}

room_goto(rm_map_level_1)

global.param_damage_phy = 0
global.param_damage_art = 1
global.param_damage_true = 2

global.param_sp_stasis = 0
global.param_sp_auto = 1
global.param_sp_atk = 2
global.param_sp_def = 3

global.param_node_void = -1
global.param_node_regular_battle = 0
global.param_node_emergency_battle = 1
global.param_node_event = 2

/// @description Combat-related nodes.
// You can write your code in this editor

global.param_battle_type_regular = 0;
global.param_battle_type_emergency = 1;
global.param_battle_type_elite = 2;
global.param_battle_type_boss = 3;
global.param_battle_type_bonus = 4;
global.param_battle_type_void = -1;

global.collection_regular_battles = [
	{
		level: 1,
		name: "The Guards",
		diff: global.param_battle_type_regular,
		enemy: [
			obj_mon_shielded_guard,
			obj_mon_automatic_doll,
			obj_mon_shielded_guard
		],
		env: function(){}
	},
	{
		level: 1,
		name: "E The Guards",
		diff: global.param_battle_type_emergency,
		enemy: [
			obj_mon_shielded_guard,
			obj_mon_automatic_doll,
			obj_mon_automatic_doll,
			obj_mon_automatic_doll,
			obj_mon_shielded_guard
		],
		env: function(){}
	}
]

