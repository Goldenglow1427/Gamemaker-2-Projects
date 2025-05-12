/// @description Insert description here
// You can write your code in this editor

event_inherited()

// Set the angle of the arrow.

var _rnd = irandom(instance_number(obj_par_monster)-1);

show_debug_message(_rnd);

var _target = instance_find(obj_par_monster, _rnd);

image_angle = point_direction(x, y, _target.x, _target.y);

speed = 7.5;
direction = image_angle;

penetrate_count = 1;
