/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_set_color(c_gray)
draw_rectangle(x-50, y-16, x+50, y-10, false)

var health_percent = self.hp / self.def_max_hitpoint * 100
health_percent = floor(health_percent)

draw_set_color(c_red)
draw_rectangle(x-50, y-16, x-50+health_percent, y-10, false)
