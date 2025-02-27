// Inherit the parent event
event_inherited();

room_goto(rm_main_battle_page)
global.record_battle_data(
	[obj_summon_def_water_spirit],
	[obj_mon_shielded_guard, obj_mon_shielded_guard, obj_mon_shielded_guard],
	[obj_skill_config_1E, obj_skill_config_2e, obj_skill_config_1S],
	[obj_skill_effect_1dmg]
)
