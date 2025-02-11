/// @description Insert description here
// You can write your code in this editor


// Check for collsion with the boundary.
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

if global.glob_time_stop
{
	speed = 0;
	return;
}


// Detect & Deal with the motions
var _speed = 0;
var _dir = 0;
if vertical_dir == -1 && horizontal_dir == 1
	_dir = 620;
else
{
	if vertical_dir == 1
		_dir += 90;
	else if vertical_dir == -1
		_dir += 270;
		
	if horizontal_dir == 1
		_dir += 0;
	else if horizontal_dir == -1
		_dir += 180;
}
if vertical_dir != 0 && horizontal_dir != 0
	_dir /= 2;
	
// Checking the speed of the player
if buff_immobilized
	_speed = 0;
else if vertical_dir != 0 || horizontal_dir != 0
	_speed = player_speed;
else
	_speed = 0;
	
_speed *= global.stat_speed_mult * buff_speed_multiplier;


if kyoko_dashing
{
	_dir = kyoko_dashing_direction;
	_speed = player_speed * 4.5;
}


motion_set(_dir, _speed);


if _dir != past_dir && _speed != 0
	past_dir = _dir;


// Change sprites based on the motions.
if character == global.char_madoka
{
	if action == global.action_idle
	{
		if _speed == 0
		{
			if clamp(past_dir, 90, 270) == past_dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_idle_left;
				else
					sprite_index = spr_madoka_idle_left;
			}
			else
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_idle_right;
				else
					sprite_index = spr_madoka_idle_right;
			}
		}
		else
		{
			if clamp(_dir, 0, 45) == _dir || clamp(_dir, 315, 359) == _dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_move_right;
				else
					sprite_index = spr_madoka_move_right;
			}
			else if clamp(_dir, 45, 134) == _dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_move_up;
				else
					sprite_index = spr_madoka_move_up;
			}
			else if clamp(_dir, 135, 224) == _dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_move_left;
				else
					sprite_index = spr_madoka_move_left;
			}
			else
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_move_down;
				else
					sprite_index = spr_madoka_move_down;
			}
		}
	}
	if action == global.action_base_attack
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			instance_create_layer(x, y, "Instances", obj_madoka_arrow);
			
			buff_immobilized = false;
			action = global.action_idle;
			
			if madoka_is_goddess
				sprite_index = spr_madoka_god_idle_right;
			else
				sprite_index = spr_madoka_idle_right;
				
			image_speed = 1.0;
		}
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_base_attack_left;
				else
					sprite_index = spr_madoka_base_attack_left;
			}
			else
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_base_attack_right;
				else
					sprite_index = spr_madoka_base_attack_right;
			}
		}
	}
	if action == global.action_casting_q
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			instance_create_layer(x, y, "Instances", obj_madoka_explosion_arrow);
			
			buff_speed_multiplier /= global.param_madoka_q_speed_mult;
			action = global.action_idle;
			
			sprite_index = spr_madoka_idle_right;
			image_speed = 1.0;
		}
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_madoka_ability_q_left;
			else
				sprite_index = spr_madoka_ability_q_right;
		}
	}
	if action == global.action_casting_e
	{
		if image_index >= 3.75
		{
			instance_create_layer(x, y, "Auras", obj_aura_madoka_defense);
			
			action = global.action_idle;
			buff_immobilized = false;
		}
	}
	if action == global.action_casting_ult
	{
		if image_index >= 7.75
		{
			instance_create_layer(x, y, "Auras", obj_aura_madoka_ultimate);
		
			madoka_is_goddess = true;
			alarm[2] = 60 * global.stat_madoka_ult_duration;
		
			action = global.action_idle;
			
			buff_immobilized = false;
		}
	}
}
else if character == global.char_sayaka
{
	if action == global.action_idle
	{
		if _speed == 0
		{
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_sayaka_idle_left
			else
				sprite_index = spr_sayaka_idle_right;
		}
		else
		{
			if clamp(_dir, 0, 45) == _dir || clamp(_dir, 315, 359) == _dir
				sprite_index = spr_sayaka_move_right;
			else if clamp(_dir, 45, 134) == _dir
				sprite_index = spr_sayaka_move_up;
			else if clamp(_dir, 135, 224) == _dir
				sprite_index = spr_sayaka_move_left;
			else
				sprite_index = spr_sayaka_move_down;
		}
	}
	if action == global.action_base_attack
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			instance_create_layer(x, y, "Instances", obj_char_bul_sayaka_melee);
			
			buff_immobilized = false;
			action = global.action_idle;
			
			sprite_index = spr_sayaka_idle_right;
				
			image_speed = 1.0;
		}
		else if image_index >= 1.5
			instance_create_layer(x, y, "Instances", obj_char_bul_sayaka_melee);
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_sayaka_base_attack_left;
			else
				sprite_index = spr_sayaka_base_attack_right;
		}
	}
	if action == global.action_casting_q
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			modify_health_value(1);
			effect_create_above(ef_ring, x, y, 0.5, c_red);
			
			buff_speed_multiplier /= global.param_madoka_q_speed_mult;
			action = global.action_idle;
			
			sprite_index = spr_sayaka_idle_right;
			image_speed = 1.0;
		}
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_sayaka_ability_q_left;
			else
				sprite_index = spr_sayaka_ability_q_right;
		}
	}
	if action == global.action_casting_e
	{
		if image_index >= 3.75
		{
			effect_create_above(ef_smokeup, x, y, 1, c_aqua);
			
			buff_speed_multiplier *= 2;
			alarm[3] = 60 * 0.75;
			
			action = global.action_idle;
			buff_immobilized = false;
		}
	}
	if action == global.action_casting_ult
	{
		if image_index >= 3.75
		{
			sayaka_remaining_freeze = 10;
			alarm[4] = 3;
		
			action = global.action_idle;
			
			buff_immobilized = false;
		}
	}
}
else if character == global.char_kyoko
{
	if action == global.action_idle
	{
		if _speed == 0
		{
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_kyoko_idle_left
			else
				sprite_index = spr_kyoko_idle_right;
		}
		else
		{
			if clamp(_dir, 0, 45) == _dir || clamp(_dir, 315, 359) == _dir
				sprite_index = spr_kyoko_move_right;
			else if clamp(_dir, 45, 134) == _dir
				sprite_index = spr_kyoko_move_up;
			else if clamp(_dir, 135, 224) == _dir
				sprite_index = spr_kyoko_move_left;
			else
				sprite_index = spr_kyoko_move_down;
		}
	}
	if action == global.action_base_attack
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			instance_create_layer(x, y, "Instances", obj_char_bul_kyoko_melee);
			
			buff_immobilized = false;
			action = global.action_idle;
			
			sprite_index = spr_kyoko_idle_left;
				
			image_speed = 1.0;
		}
		else if image_index >= 1.5
			instance_create_layer(x, y, "Instances", obj_char_bul_kyoko_melee);
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_kyoko_base_attack_left;
			else
				sprite_index = spr_kyoko_base_attack_right;
		}
	}
	if action == global.action_casting_q
	{
		// show_debug_message(image_index);
		
		if image_index >= 3.75
		{
			modify_health_value(-1);
			effect_create_above(ef_ring, x, y, 0.5, c_red);
			
			buff_kyoko_q_ability = true;
			alarm[6] = 60 * 10;
			
			buff_immobilized = false;
			
			sprite_index = spr_kyoko_idle_right;
			image_speed = 1.0;
			
			action = global.action_idle;
		}
		else
		{
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_kyoko_ability_q_left;
			else
				sprite_index = spr_kyoko_ability_q_right;
		}
	}
	if action == global.action_casting_e
	{
		if image_index >= 3.75
		{
			kyoko_dashing = true;
			kyoko_dashing_direction = point_direction(x, y, mouse_x, mouse_y);
			
			alarm[7] = 10;
			
			action = global.action_idle;
			buff_immobilized = false;
			image_speed = 1;
		}
	}
	/*
	if action == global.action_casting_ult
	{
		if image_index >= 3.75
		{
			sayaka_remaining_freeze = 10;
			alarm[4] = 3;
		
			action = global.action_idle;
			
			buff_immobilized = false;
		}
	}
	*/
}



// Deal with action.
if character == global.char_madoka
{
	if mouse_check_button_pressed(mb_left)
	{
		if action == global.action_idle && sanity[character] >= 5
		{
			action = global.action_base_attack;
			sanity[character] -= 5;
			
			sanity[character] = clamp(sanity[character], 0, max_sanity[character]);
			
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_base_attack_left;
				else
					sprite_index = spr_madoka_base_attack_left;
			}
			else
			{
				if madoka_is_goddess
					sprite_index = spr_madoka_god_base_attack_right;
				else
					sprite_index = spr_madoka_base_attack_right;
			}
			image_index = 0;
			image_speed = 1 * global.stat_charge_mult;
			
			buff_immobilized = true;
		}
	}
	
	// Explosion arrow.
	if keyboard_check(ord("Q")) && sanity[character] >= global.stat_madoka_q_cost
	{
		if action == global.action_idle
		{
			action = global.action_casting_q;
			sanity[character] -= global.stat_madoka_q_cost;
			
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_madoka_ability_q_left;
			else
				sprite_index = spr_madoka_ability_q_right;
			image_index = 0;
			
			
			image_speed = 1 * global.stat_charge_mult;
			
			buff_speed_multiplier *= global.param_madoka_q_speed_mult;
		}
	}
	
	// Create the aura.
	if keyboard_check(ord("E")) && sanity[character] >= global.stat_madoka_e_cost
	{
		if action == global.action_idle
		{
			action = global.action_casting_e;
			
			sanity[character] -= global.stat_madoka_e_cost;
			
			buff_immobilized = true;
			
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_madoka_ability_e_left;
			else
				sprite_index = spr_madoka_ability_e_right;
			image_index = 0;
		}
	}
	
	// Use the ultimate.
	if keyboard_check(ord("R")) && sanity[character] >= 900
	{
		if action == global.action_idle && !madoka_is_goddess
		{
			action = global.action_casting_ult;
			
			sanity[character] -= 900;
			
			buff_immobilized = true;
			
			sprite_index = spr_madoka_ability_ult_transit;
			image_index = 0;
		}
	}
}
else if character == global.char_sayaka
{
	if mouse_check_button_pressed(mb_left)
	{
		if action == global.action_idle && sanity[character] >= 5
		{
			action = global.action_base_attack;
			sanity[character] -= 5;
			
			sanity[character] = clamp(sanity[character], 0, max_sanity[character]);
			
			melee_attack_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(melee_attack_dir, 90, 270) == melee_attack_dir
			{
				sprite_index = spr_sayaka_base_attack_left;
			}
			else
			{
				sprite_index = spr_sayaka_base_attack_right;
			}
			image_index = 0;
			image_speed = 1 * global.stat_charge_mult;
			
			buff_immobilized = true;
		}
	}
	
	// Healing.
	if keyboard_check(ord("Q")) && sanity[character] >= global.stat_madoka_q_cost
	{
		if action == global.action_idle
		{
			action = global.action_casting_q;
			sanity[character] -= global.stat_madoka_q_cost;
			
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_sayaka_ability_q_left;
			else
				sprite_index = spr_sayaka_ability_q_right;
			image_index = 0;
			
			
			image_speed = 1 * global.stat_charge_mult;
			
			buff_speed_multiplier *= global.param_madoka_q_speed_mult;
		}
	}
	
	
	// Create the aura.
	if keyboard_check(ord("E")) && sanity[character] >= global.stat_madoka_e_cost
	{
		if action == global.action_idle
		{
			action = global.action_casting_e;
			
			sanity[character] -= global.stat_madoka_e_cost;
			
			buff_immobilized = true;
			
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_sayaka_ability_e_left;
			else
				sprite_index = spr_sayaka_ability_e_right;
			image_index = 0;
		}
	}
	
	// Use the ultimate.
	if keyboard_check(ord("R")) && sanity[character] >= 10
	{
		if action == global.action_idle
		{
			action = global.action_casting_ult;
			
			sanity[character] -= 10;
			
			buff_immobilized = true;
			
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_sayaka_ability_ult_left;
			else
				sprite_index = spr_sayaka_ability_ult_right;
				
			image_index = 0;
			image_speed = 0.3;
		}
	}
}
else if character == global.char_kyoko
{
	if mouse_check_button_pressed(mb_left)
	{
		if action == global.action_idle && sanity[character] >= 5
		{
			action = global.action_base_attack;
			sanity[character] -= 5;
			
			sanity[character] = clamp(sanity[character], 0, max_sanity[character]);
			
			melee_attack_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(melee_attack_dir, 90, 270) == melee_attack_dir
			{
				sprite_index = spr_kyoko_base_attack_left;
			}
			else
			{
				sprite_index = spr_kyoko_base_attack_right;
			}
			image_index = 0;
			
			if buff_kyoko_q_ability
				image_speed = 1.5;
			else
				image_speed = 1;
			
			buff_immobilized = true;
		}
	}
	
	// Healing.
	if keyboard_check(ord("Q")) && sanity[character] >= global.stat_madoka_q_cost
	{
		if action == global.action_idle && buff_kyoko_q_ability == false
		{
			action = global.action_casting_q;
			sanity[character] -= global.stat_madoka_q_cost;
			
			var _aim_dir = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(_aim_dir, 90, 270) == _aim_dir
				sprite_index = spr_kyoko_ability_q_left;
			else
				sprite_index = spr_kyoko_ability_q_right;
			image_index = 0;
			
			image_speed = 0.5;
			
			buff_immobilized = true;
		}
	}
	
	// Create the aura.
	if keyboard_check(ord("E")) && sanity[character] >= global.stat_madoka_e_cost
	{
		if action == global.action_idle && kyoko_dashing_anti_combo == false
		{
			action = global.action_casting_e;
			
			sanity[character] -= global.stat_madoka_e_cost;
			
			buff_immobilized = true;
			
			kyoko_dashing_direction = point_direction(x, y, mouse_x, mouse_y);
			
			if clamp(kyoko_dashing_direction, 90, 270) == kyoko_dashing_direction
				sprite_index = spr_kyoko_ability_e_left;
			else
				sprite_index = spr_kyoko_ability_e_right;
			image_index = 0;
			
			image_speed = 2;
		}
	}
	
	// Use the ultimate.
	if keyboard_check(ord("R")) && sanity[character] >= 10
	{
		if action == global.action_idle
		{
			action = global.action_casting_ult;
			
			sanity[character] -= 10;
			
			buff_immobilized = true;
			
			if clamp(past_dir, 90, 270) == past_dir
				sprite_index = spr_sayaka_ability_ult_left;
			else
				sprite_index = spr_sayaka_ability_ult_right;
				
			image_index = 0;
			image_speed = 0.3;
		}
	}
}

// Switch characters
if keyboard_check(ord("1")) && character != global.char_list[0] && action == global.action_idle
	switch_to_character(global.char_list[0]);
	
if keyboard_check(ord("2")) && character != global.char_list[1] && action == global.action_idle
	switch_to_character(global.char_list[1]);

if keyboard_check(vk_shift) && action == global.action_idle
	switch_to_character(global.char_list[0] + global.char_list[1] - character);
