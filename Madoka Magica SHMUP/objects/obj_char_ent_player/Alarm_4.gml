/// @description Insert description here
// You can write your code in this editor

if global.glob_time_stop
	alarm[4] = 60;
else
{
	instance_create_layer(x, y, "Auras", obj_char_bul_sayaka_ultimate_splash);
	effect_create_above(ef_ring, x, y, 10, c_aqua);

	if sayaka_remaining_freeze > 0
	{
		sayaka_remaining_freeze--;
		alarm[4] = 60;
	}
}