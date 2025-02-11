/// @description Insert description here
// You can write your code in this editor

// Variables

global.color_homura = #6C5B6F;
global.color_kyoko = #B15F6E;
global.color_madoka = #FF8392;
global.color_mami = #FBD16C;
global.color_sayaka = #8AB8F0;


global.var_char_count_basic_monster = 0;
global.var_char_count_large_monster = 0;
global.var_char_count_fast_monster = 0;
global.var_char_count_range_monster = 0;
global.var_char_count_boost_monster = 0;



// Debug settings.
global.toggle_show_debug_msg = true;

global.char_madoka = 0; // Keybinding: 1
global.char_homura = 1; // Keybinding: 2
global.char_mami = 2; // Keybinding: 3
global.char_sayaka = 3; // Keybinding: 4
global.char_kyoko = 4;


global.action_idle = 0;
global.action_base_attack = 1;
global.action_casting_q = 2;
global.action_casting_e = 3;
global.action_casting_ult = 4;

global.game_time = 0;

// Global game parameters.
global.glob_time_stop = false;


// About monster generation.
global.param_monster_gen_type_count = 3;
global.param_monster_gen_chance = [
	[10, 9, 1, 0],	// 0-30 second.
	[10, 6, 2, 2],	// 30-75 second.
	[10, 4, 3, 3],	// 75-120 second.
	[10, 2, 4, 4],	// 120-180 second.
	[10, 1, 6, 3],	// 180-240 second.
	[10, 0, 3, 7]	// 240-300 second.
];
global.param_monster_gen_type = [
	obj_basic_monster, obj_fast_monster, obj_large_monster
];

global.param_shooter_gen_type_count = 1;
global.param_shooter_gen_chance = [
	[10, 10],	// 0-30 second.
	[10, 10],	// 30-75 second.
	[10, 10],	// 75-120 second.
	[10, 10],	// 120-180 second.
	[10, 10],	// 180-240 second.
	[10, 10]	// 240-300 second.
];
global.param_shooter_gen_type = [
	obj_mons_shooter_basic
];

global.param_inspirer_gen_type_count = 1;
global.param_inspirer_gen_chance = [
	[10, 10],	// 0-30 second.
	[10, 10],	// 30-75 second.
	[10, 10],	// 75-120 second.
	[10, 10],	// 120-180 second.
	[10, 10],	// 180-240 second.
	[10, 10]	// 240-300 second.
];
global.param_inspirer_gen_type = [
	obj_mons_inspirer_haste
];


// Upgrade window.
global.upg_max_experience = [
	15, 20, 25, 30, 40, 60, 80, 120, 150, 200, 250, 350, 500,
	1000, 1500, 10000, 90000
];

global.upg_madoka_list = [
	obj_upd_madoka_charge_time_lv1,
	obj_upd_madoka_charge_time_lv2,
	obj_upd_madoka_charge_time_lv3,
	
	obj_upd_madoka_auto_damage_lv1,
	obj_upd_madoka_auto_damage_lv2,
	obj_upd_madoka_auto_damage_lv3,
	
	obj_upd_madoka_mana_limit_lv1,
	obj_upd_madoka_mana_limit_lv2,
	obj_upd_madoka_mana_limit_lv3,
	
	obj_upd_madoka_move_spd_lv1,
	obj_upd_madoka_move_spd_lv2,
	obj_upd_madoka_move_spd_lv3
];

global.upg_madoka_possible = [
	true, false, false,
	true, false, false,
	true, false, false,
	true, false, false
];


// About Madoka
global.param_madoka_q_speed_mult = 0.1;


// Player stats that can be upgraded.
global.stat_speed_mult = 1.0;
global.stat_charge_mult = 1.0;
global.stat_health_regen_rate = 30.0;


global.stat_madoka_mana_limit = 200;

global.stat_madoka_auto_damage = 20;

global.stat_madoka_q_cost = 20;

global.stat_madoka_e_cost = 30;
global.stat_madoka_e_duration = 5;

global.stat_madoka_ult_max_arrow = 3;
global.stat_madoka_ult_duration = 10;

