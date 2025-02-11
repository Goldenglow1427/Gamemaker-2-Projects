/// @description Insert description here
// You can write your code in this editor

if !other.invulnerability
	penetrate_count--;

other.on_damage(global.stat_madoka_auto_damage);
	
if penetrate_count == 0
	instance_destroy(self);
