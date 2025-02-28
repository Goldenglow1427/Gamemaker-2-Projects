/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_set_color(c_gray)
draw_rectangle(x-50, y-16, x+50, y-10, false)

var health_percent = self.hp / self.def_max_hp * 100
health_percent = floor(health_percent)

draw_set_color(hp_bar_color)
draw_rectangle(x-50, y-16, x-50+health_percent, y-10, false)

// Special effects.
// Shields.
if self.ef_shield > 0
{
	draw_sprite(spr_ef_shield_outline, 0, x, y)
}

// Necrosis damage.
draw_set_color(c_red)
draw_rectangle(x-30, y-60, x+30, y-57, true);
if self.ef_burn_active == true
{
	draw_set_color(c_orange);
	draw_rectangle(x-30, y-60, x+30, y-57, false);
}
else
{
	draw_set_color(c_red);
	draw_rectangle(x-30, y-60, x-30+6*self.ef_burn_dmg, y-57, false);
}

draw_set_color(c_gray)
draw_rectangle(x-30, y-50, x+30, y-47, true);
if self.ef_necrosis_active == true
{
	draw_set_color(c_ltgray);
	draw_rectangle(x-30, y-50, x+30, y-47, false);
}
else
{
	draw_set_color(c_gray);
	draw_rectangle(x-30, y-50, x-30+6*self.ef_necrosis_dmg, y-47, false);
}
