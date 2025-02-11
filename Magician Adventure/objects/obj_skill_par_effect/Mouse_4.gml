/// @description Insert description here
// You can write your code in this editor

if obj_battle_control.card_effect != pointer_null
{
	obj_battle_control.card_effect.selected = false
}

obj_battle_control.card_effect = self
self.selected = true
