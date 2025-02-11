/// @description Insert description here
// You can write your code in this editor

var _angle = point_direction(x, y, obj_char_ent_player.x, obj_char_ent_player.y);

_angle += random_range(-20, 20);
_angle = (_angle + 360) % 360;


image_angle = _angle;
direction = _angle;
speed = default_speed;
