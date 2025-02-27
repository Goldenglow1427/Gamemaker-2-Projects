/// @description To create this variable.

event_inherited()

take_effect = function(target)
{
	target.f_take_damage({
		type: global.param_damage_phy,
		amount: 10
	});
}
