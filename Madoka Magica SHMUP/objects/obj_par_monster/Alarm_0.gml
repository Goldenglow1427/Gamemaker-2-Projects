/// @description Trigger when take damage.
// You can write your code in this editor

if hitpoint <= 0
{
	effect_create_above(ef_firework, x, y, 0.6, c_white);
	instance_destroy(self);
}
else
	effect_create_above(ef_spark, x, y, 1, c_white);
