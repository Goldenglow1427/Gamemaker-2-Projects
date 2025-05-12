/// @description Shooting the bullets periodically.
// You can write your code in this editor

aim_line = instance_create_layer(x, y, "Instances", obj_mon_sup_aim_line);
aim_dir = point_direction(x, y, obj_char_ent_player.x, obj_char_ent_player.y);

aim_line.image_angle = aim_dir;

immobilized = true
aiming = true

alarm[5] = 60;
