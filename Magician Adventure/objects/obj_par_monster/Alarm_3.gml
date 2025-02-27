/// @description Method to shake the monster upwards.
// You can write your code in this editor

if y == def_y - 20
{
	// show_debug_message(1);
	
	self.com_activate_effect();
	
	self.cur_dir = -1;
	
	y += 5;
	
	alarm[3] = 2;
}
else if self.cur_dir == 1
{
	// show_debug_message(2);
	
	y -= 5;
	alarm[3] = 2;
}
else if self.y != def_y
{
	// show_debug_message(3);
	
	self.y += 5;
	alarm[3] = 2;
}
else
{
	// show_debug_message(4);
	
	self.cur_dir = 1;
	
	alarm[9] = 20;
}

