/// @description Insert description here
// You can write your code in this editor

points = 0;

powerup_time = 10;

for(var _i=0; _i<100; _i++)
	instance_create_layer(irandom_range(0, 4000), irandom_range(0, 4000), "Instances", obj_rock);
