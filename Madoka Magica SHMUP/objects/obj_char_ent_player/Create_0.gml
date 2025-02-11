/// @description Insert description here
// You can write your code in this editor

// Variables
player_speed = 3;

vertical_dir = 0;
horizontal_dir = 0;

past_dir = 0; // Record the previous direction for IDLE sprite setting.

character = global.char_list[0];
action = global.action_idle;

hitpoint = 6;
sanity = [global.stat_madoka_mana_limit, 600, 120, 18000, 20000];
max_sanity = [global.stat_madoka_mana_limit, 600, 120, 18000, 20000];

level = 0;
experience = 0;


melee_attack_dir = 0;


// Special effects.
buff_immobilized = false;
buff_speed_multiplier = 1.0;

buff_cannot_switch_character = false;
buff_lock_character = false;

buff_kyoko_q_ability = false;


// For Madoka Kaname
madoka_is_goddess = false;

// For Sayaka Miki
sayaka_remaining_freeze = 10;

// For Kyoko Sakura
kyoko_dashing = false;
kyoko_dashing_direction = 0;
kyoko_dashing_anti_combo = false;


// Set the default sprite
sprite_index = spr_madoka_idle_right;


/// @description Try to switch to certain character.
function switch_to_character(_index)
{
	if buff_cannot_switch_character
		return;
	
	character = _index;
	
	buff_kyoko_q_ability = false;
	
	buff_cannot_switch_character = true;
	alarm[5] = 60;
}


/// @description Triggered when the player sees an upgrade.
function get_experience(_value)
{
	experience += _value;
	
	if experience >= global.upg_max_experience[level]
	{
		experience -= global.upg_max_experience[level];
		level++;
		
		obj_upgrade_template.alarm[0] = 1;
	}
}

/// @description Triggered when the player sees an upgrade.
function get_mana(_value)
{
	sanity[character] += _value;
	
	if sanity[character] >= max_sanity[character]
		sanity[character] = max_sanity[character];
}


/// @description Triggered to change the health value.
function modify_health_value(_value)
{
	if _value < 0 && buff_kyoko_q_ability
	{
		var _rnd = irandom_range(1, 10);
		
		if _rnd <= 3
			return;
	}
	
	hitpoint += _value;
	
	hitpoint = clamp(hitpoint, 0, 6);
	
	alarm[0] = 1;
}