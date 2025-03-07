/// @description Insert description here
// You can write your code in this editor

level = 1;
stage_name = def_stage_name;

traversed = false;

type = global.param_node_void;

// If is battle.
node_battle_enemy = []
node_battle_env = pointer_null


f_initialize_regular_battle = function()
{
	var possible = []
	self.type = global.param_node_regular_battle;
	
	for(var i=0; i<array_length(global.collection_regular_battles); i++)
	{
		var tar = global.collection_regular_battles[i];
		
		if(tar.level == self.level && tar.diff == global.param_battle_type_regular)
			array_insert(possible, 0, tar);
	}
	
	var rnd = irandom_range(0, array_length(possible)-1);
	stage_name = possible[rnd].name;
	node_battle_enemy = possible[rnd].enemy;
	node_battle_env = possible[rnd].env;
}

f_initialize_emergency_battle = function()
{
	var possible = []
	self.type = global.param_node_emergency_battle;
	
	for(var i=0; i<array_length(global.collection_regular_battles); i++)
	{
		var tar = global.collection_regular_battles[i];
		
		if(tar.level == self.level && tar.diff == global.param_battle_type_emergency)
			array_insert(possible, 0, tar);
	}
	
	var rnd = irandom_range(0, array_length(possible)-1);
	stage_name = possible[rnd].name;
	node_battle_enemy = possible[rnd].enemy;
	node_battle_env = possible[rnd].env;
}
