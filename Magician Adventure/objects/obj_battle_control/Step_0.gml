/// @description Insert description here
// You can write your code in this editor

if card_config != pointer_null && card_effect != pointer_null
{
	if card_config.target_required == false || card_target != pointer_null
	{
		valid_to_cast = true
	}
	else
		valid_to_cast = false
}
else
	valid_to_cast = false
