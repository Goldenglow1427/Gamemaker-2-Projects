/// @description Insert description here
// You can write your code in this editor

other.on_damage(damage);

effect_create_above(ef_explosion, x, y, 3, c_purple);

instance_create_layer(x, y, "Instances", obj_madoka_explosion_arrow_splash);

instance_destroy(self);
