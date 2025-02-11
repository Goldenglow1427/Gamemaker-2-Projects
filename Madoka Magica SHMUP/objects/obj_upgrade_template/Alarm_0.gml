/// @description Invoked when an update is about to be made.

var _upgrade_list[];

global.glob_time_stop = true;

/*
for(var _i=0; _i<3; _i++)
{
 	_upgrade_list[_i] = get_random_upgrade();
}
*/

_upgrade_list = choose_random_upgrades(get_all_upgrades());

x = camera_get_view_x(view_camera[0]) + 200;
y = camera_get_view_y(view_camera[0]) + 150;

for(var _i=0; _i<3; _i++)
{
	options[_i] = instance_create_layer(x, y, "UpgradeOptions", _upgrade_list[_i]);
	options[_i].alarm[_i+1] = 1;
}