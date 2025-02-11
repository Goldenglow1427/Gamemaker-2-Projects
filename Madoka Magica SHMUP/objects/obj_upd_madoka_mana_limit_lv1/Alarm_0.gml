/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.stat_madoka_mana_limit = 500;

obj_char_ent_player.sanity[global.char_madoka] += 300;
obj_char_ent_player.max_sanity[global.char_madoka] = 500;

obj_upgrade_template.alarm[1] = 1;
