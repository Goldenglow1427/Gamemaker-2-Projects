/// @description Insert description here
// You can write your code in this editor

if obj_battle_control.card_config != pointer_null
{
	obj_battle_control.card_config.selected = false
}

obj_battle_control.card_config = self
self.selected = true
