/// @description Insert description here
// You can write your code in this editor


options = [0, 0, 0];


/// @description Get a random upgrade.
function get_random_upgrade()
{
	var _psb = 0;
	for(var _i=0; _i<array_length(global.upg_madoka_list); _i++)
	{
		if(global.upg_madoka_possible[_i])
			_psb++;
	}
	
	if _psb == 0
		return 0;
		
	var _id = irandom_range(1, _psb);
	for(var _i=0; _i<array_length(global.upg_madoka_list); _i++)
	{
		if(global.upg_madoka_possible[_i])
		{
			_id--;
			if _id == 0
				return global.upg_madoka_list[_i];
		}
	}
	
	return -1;
}

function get_all_upgrades()
{
	var _return = [];
	for(var _i=0; _i<array_length(global.upg_madoka_list); _i++)
		if(global.upg_madoka_possible[_i])
			array_insert(_return, 0, global.upg_madoka_list[_i]);
	
	return _return;
}

function choose_random_upgrades(_list_of_objects)
{
	if global.toggle_show_debug_msg
		show_debug_message("Function call: choose_random_upgrades");
	
	var _len = array_length(_list_of_objects);
	
	if _len <= 3
		return _list_of_objects;
		
	var _x1 = irandom_range(0, _len-1);
	var _x2 = irandom_range(0, _len-2);
	var _x3 = irandom_range(0, _len-3);
	
	if _x2 >= _x1
		_x2++;
	else
	{
		_x2 = _x1 + _x2;
		_x1 = _x2 - _x1;
		_x2 = _x2 - _x1;
	}
		
	if _x3 >= _x1
		_x3++;
	if _x3 >= _x2
		_x3++;
		
	return [_list_of_objects[_x1], _list_of_objects[_x2], _list_of_objects[_x3]];
}
