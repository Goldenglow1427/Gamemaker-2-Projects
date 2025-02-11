/// @description Insert description here
// You can write your code in this editor

other.hitpoint -= damage;
other.alarm[0] = 1;

effect_create_above(ef_explosion, x, y, 1, c_red);

instance_destroy(self);
