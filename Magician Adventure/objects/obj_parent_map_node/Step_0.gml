/// @description Insert description here
// You can write your code in this editor


// Check if the current node is selected.
if dep == obj_map_control.cur_depth && order == obj_map_control.cur_id
	image_blend = c_aqua;
else if obj_map_control.f_check_valid_move(self.dep, self.order)
	image_blend = c_yellow;
else if self.traversed
	image_blend = c_gray;
else if self.dep <= obj_map_control.cur_depth
	image_blend = c_dkgray;
else
	image_blend = c_white;
