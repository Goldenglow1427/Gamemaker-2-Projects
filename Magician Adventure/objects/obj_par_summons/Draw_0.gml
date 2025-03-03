/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_halign(fa_center)
draw_set_color(c_white)
draw_text(x, y-90, string("TAUNT: {0}", self.taunt))
