/// @description Insert description here
// You can write your code in this editor

// Check death.
if self.hp <= 0
	alarm[10] = 1
	
if self.selected
	image_blend = on_selection_color
else
	image_blend = c_white
