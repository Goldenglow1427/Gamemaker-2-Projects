/// @description Insert description here
// You can write your code in this editor

if obj_battle_control.on_player_turn == false
	return

if selected
{
	selected = false
	obj_battle_control.card_target = pointer_null
	return
}

if obj_battle_control.card_target != pointer_null
	obj_battle_control.card_target.selected = false

obj_battle_control.card_target = self.id
selected = true
