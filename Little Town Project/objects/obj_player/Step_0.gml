///// @description Insert description here
// You can write your code in this editor

// Calculating the movement of the character.

move_up = keyboard_check(ord("W"));
move_left = keyboard_check(ord("A"));
move_down = keyboard_check(ord("S"));
move_right = keyboard_check(ord("D"));

vx = (move_right-move_left) * walk_speed;
vy = (move_down - move_up) * walk_speed;

depth = -y;

if vx == 0 && vy == 0
{
	switch dir
	{
		case 0: sprite_index = spr_player_idle_right; break;
		case 1: sprite_index = spr_player_idle_up; break;
		case 2: sprite_index = spr_player_idle_left; break;
		case 3: sprite_index = spr_player_idle_down; break;
	}
}
else
{
	if vx != 0
	{
		if vx > 0
			dir = 0;
		else
			dir = 2;
	
		if !collision_point(x+vx, y, obj_par_environment, true, true)
			x += vx;
	}

	if vy != 0
	{
		if vy > 0
			dir = 3;
		else
			dir = 1;
		if !collision_point(x, y+vy, obj_par_environment, true, true)
			y += vy;
	}
	
	switch dir
	{
		case 0: sprite_index = spr_player_walk_right; break;
		case 1: sprite_index = spr_player_walk_up; break;
		case 2: sprite_index = spr_player_walk_left; break;
		case 3: sprite_index = spr_player_walk_down; break;
	}
}