/// @description Insert description here
// You can write your code in this editor

var CAM_SPEED = 3

var cur_pos = camera_get_view_x(view_camera[0])

show_debug_message(string("{0}", cur_pos))

if keyboard_check(ord("A"))
	cur_pos -= CAM_SPEED
else if keyboard_check(ord("D"))
	cur_pos += CAM_SPEED
	
cur_pos = clamp(cur_pos, 0, room_width-1280)
camera_set_view_pos(view_camera[0], cur_pos, 0)

