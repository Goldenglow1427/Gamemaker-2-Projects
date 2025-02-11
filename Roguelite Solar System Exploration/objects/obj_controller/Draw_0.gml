/// @description Insert description here
// You can write your code in this editor

if self.char1 != pointer_null
{
	draw_set_color(c_white)
	
	draw_arrow(self.char1.x, self.char1.y, mouse_x, mouse_y, 50)
	draw_line_width(self.char1.x, self.char1.y, mouse_x, mouse_y, 5)
}

draw_set_color(c_white)
draw_text_transformed(1000, 0, string("Remaining Energy: {0}", self.energy),
	1.5, 1.5, 0)
