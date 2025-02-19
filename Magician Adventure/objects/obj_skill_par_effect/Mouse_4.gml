/// @description Insert description here
// You can write your code in this editor

if selected
{
	obj_battle_control.card_effect = pointer_null
	selected = false
	return
}

if obj_battle_control.card_effect != pointer_null
{
	obj_battle_control.card_effect.selected = false
}

obj_battle_control.card_effect = self
self.selected = true
