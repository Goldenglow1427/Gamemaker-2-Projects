/// @description Insert description here
// You can write your code in this editor

show_debug_log(true)

global.player_health = 60
global.player_mana = 5

global.start_battle = function(list_of_enemy, list_of_config, list_of_effect)
{	
	// room_goto(rm_main_battle_page)
	
	if array_length(list_of_config) > 5 or array_length(list_of_enemy) > 5
	{
		show_debug_message("Error in setting up battle - too many skills equipped.")
	}
	
	obj_battle_control.enemy_count = array_length(list_of_enemy)
	for(var i=0; i<obj_battle_control.enemy_count; i++)
	{
		instance_create_layer(640-75*(obj_battle_control.enemy_count-1)+i*150, 228, "Opponents", list_of_enemy[i]);
	}
	
	for(var i=0; i<5; i++)
	{
		if i >= array_length(list_of_config)
			instance_create_layer(416-96*i, 640, "Buttons", obj_skill_interface)
		else
			instance_create_layer(416-96*i, 640, "Buttons", list_of_config[i])
	}
	for(var i=0; i<5; i++)
	{
		if i >= array_length(list_of_effect)
			instance_create_layer(800+96*i, 640, "Buttons", obj_skill_interface)
		else
			instance_create_layer(800+96*i, 640, "Buttons", list_of_effect[i])
	}
}

room_goto(rm_main_battle_page)

var enemy_list = [obj_monster_shield_zombie]
var empty_list = []
