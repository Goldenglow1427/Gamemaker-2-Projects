/// @description Insert description here
// You can write your code in this editor

instance_destroy(other)
effect_create_above(ef_explosion, x, y, 1, c_white)

direction = random(360);

if sprite_index == spr_rock_big
{
	sprite_index = spr_rock_small;
	instance_copy(true);
	
	obj_game.points += 50;
}
else if instance_number(obj_rock) < 200
{
	sprite_index = spr_rock_big;
	x = -100;
	
	obj_game.points += 25;
}
else
{
	instance_destroy();
	
	obj_game.points += 25;
}