/// @description Trigger when take damage.
// You can write your code in this editor

obj_health_bar.alarm[hitpoint] = 1;

if hitpoint <= 0
{
	sprite_index = spr_madoka_die_right;
	global.glob_time_stop = true;
	
	obj_env_ctrl_sound_maingame.alarm[0] = 1;
	alarm[10] = 120;
}
if hitpoint != 6
	alarm[1] = 60 * global.stat_health_regen_rate;
