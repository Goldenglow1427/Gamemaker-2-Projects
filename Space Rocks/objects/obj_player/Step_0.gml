/// @description Insert description here
// You can write your code in this editor

// Constants

speed = speed * friction_decay; 

// move_wrap(true, true, 0)
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

var _accelerated = false;

if keyboard_check(ord("W"))
{
	motion_add(image_angle, 0.1);
	_accelerated = true;
}
if keyboard_check(ord("S"))
{
	motion_add(image_angle, -0.1);
	_accelerated = true;
}

// Rotations
if keyboard_check(ord("A"))
{
	image_angle += 4;
	_accelerated = true;
}
if keyboard_check(ord("D"))
{
	image_angle -= 4;
	_accelerated = true;
}

// Shooting
if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x, y, "Instances", obj_bullet);
	
	if powerup == 1
	{
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 10;
		
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 10;
	}
}

// Change sprite index
if _accelerated
{
	sprite_index = spr_spaceship_accelerate;
}
else
{
	sprite_index = spr_spaceship;
}