/// @description Clears all current selections
// You can write your code in this editor

if card_config != pointer_null
	card_config.selected = false
if card_effect != pointer_null
	card_effect.selected = false
if card_target != pointer_null
	card_target.selected = false

card_config = pointer_null
card_effect = pointer_null
card_target = pointer_null
