/// @description Insert description here
// You can write your code in this editor


var bul = instance_create_layer(x, y, "Instances", obj_bul_shooter_basic);
bul.direction = aim_dir
bul.image_angle = aim_dir

instance_destroy(aim_line)

immobilized = false
aiming = false

alarm[2] = 120;
