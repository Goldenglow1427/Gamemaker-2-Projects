/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp_bar_color = c_lime
on_selection_color = c_yellow

// Communication between skills.
com_active_skill = pointer_null;

// List of skills to be used, by instance.
list_of_abilities = []

f_set_active_skill = function(obj_skill)
{
	if com_active_skill != pointer_null
	{
		com_active_skill.active = false;
		if obj_skill != pointer_null and com_active_skill.id == obj_skill.id
		{
			com_active_skill = pointer_null;
			return;
		}
	}
	
	com_active_skill = obj_skill
	
	if obj_skill != pointer_null
		obj_skill.active = true;
}

for(var i=0; i<array_length(def_list_of_skill_object); i++)
{
	var inst = instance_create_layer(x+57, y-165+i*40, "Buttons",
		def_list_of_skill_object[i]);
		
	inst.parent_object = self.id;
	array_push(list_of_abilities, inst);
}
