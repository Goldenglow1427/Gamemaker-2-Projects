/// @description Insert description here
// You can write your code in this editor



if effect_screen_shake
{
	camera_set_view_pos(view_camera[0], _view_x+random_range(-3, 3), _view_y+random_range(-3, 3));
}
else
{
	camera_set_view_pos(view_camera[0], _view_x, _view_y);
}
