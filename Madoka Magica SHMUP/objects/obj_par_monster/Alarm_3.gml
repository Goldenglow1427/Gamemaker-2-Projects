/// @description Triggered on death for drop-offs.
// You can write your code in this editor

var _rnd = random_range(1, 100);

if _rnd <= par_grief_seed_chance
	instance_create_layer(x, y, "Instances", obj_env_ent_grief_seed);
else
	instance_create_layer(x, y, "Instances", obj_basic_experience_ball);

instance_destroy(self);
