/// @description Insert description here
// You can write your code in this editor

var node_count = instance_number(obj_parent_map_node);

for(var i=0; i<node_count; i++)
{
	var rnd = random_range(1, 100);
	var inst = instance_find(obj_parent_map_node, i);
	
	if 1 <= rnd && rnd <= 80
		inst.f_initialize_regular_battle();
	else
		inst.f_initialize_emergency_battle();
}
