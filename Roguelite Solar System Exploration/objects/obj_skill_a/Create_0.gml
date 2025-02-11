/// @description Insert description here
// You can write your code in this editor

function trigger()
{
	if obj_controller.energy >= 1
	{
		global.single_target.hitpoint -= (1 + global.atk_buff)
		obj_controller.energy--
	}
}
