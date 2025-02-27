/// @description Insert description here
// You can write your code in this editor

hori_defa = 200;
hori_dist = 350;


level = 1;
stage_list = [3, 4, 4, 3];
connect_list = [[1, 2, 1], [1, 1, 1, 1], [2, 1, 1]]

cur_depth = -1;
cur_id = 0;

stable_connections = []
/*
Formatting:
{
	dep: (int), the smaller node's depth;
	from: (int), using 0-index;
	to: (int), using 1-index;
}
*/

f_generate_stage_map = function(list_of_levels)
{
	// Put the stage blocks on the field.
	for(var i=0; i<array_length(list_of_levels); i++)
	{
		for(var j=0; j<list_of_levels[i]; j++)
		{
			var inst = instance_create_layer(hori_defa + hori_dist * i,
				360-130/2*(list_of_levels[i]-1)+130*j,
				"Instances",
				obj_map_battle_node);
				
			inst.dep = i;
			inst.order = j;
		}
			
	}
	
	stable_connections = []
	// Creating Connections.
	for(var i=0; i<array_length(stage_list)-1; i++)
	{
		if(stage_list[i] == stage_list[i+1])
		{	
			for(var j=0; j<stage_list[i]; j++)
			{
				array_insert(stable_connections, 0,
				{
					dep: i,
					from: j,
					to: j
				})
			}
		}
		else if(stage_list[i] < stage_list[i+1])
		{
			var cur_index = 0;
			for(var j=0; j<stage_list[i]; j++)
			{
				for(var k=0; k<connect_list[i][j]; k++)
				{
					array_insert(stable_connections, 0,
					{
						dep: i,
						from: j,
						to: cur_index
					})
					cur_index++;
				}
			}
		}
		else if(stage_list[i] > stage_list[i+1])
		{
			var cur_index = 0;
			for(var j=0; j<stage_list[i+1]; j++)
			{
				for(var k=0; k<connect_list[i][j]; k++)
				{
					array_insert(stable_connections, 0,
					{
						dep: i,
						from: cur_index,
						to: j
					})
					cur_index++;
				}
			}
		}
		else
		{
			show_debug_message("What the fuck");
			game_end(-1);
		}
	}
}
f_attempt_to_move = function(next_id)
{
	show_debug_message(stable_connections);
	show_debug_message({dep: cur_depth, from: cur_id, to: next_id});
	
	if cur_depth == -1
	{
		cur_depth++;
		cur_id = next_id;
		
		return true;
	}
	
	for(var i=0; i<array_length(stable_connections); i++)
	{
		if stable_connections[i].dep == cur_depth && stable_connections[i].from == cur_id && stable_connections[i].to = next_id
		{
			cur_depth++;
			cur_id = next_id;
			return true;
		}
	}
	
	return false;
}


f_generate_stage_map(stage_list);
