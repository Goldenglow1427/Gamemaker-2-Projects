/// @description Trigger combined skills.
// You can write your code in this editor

if self.card_config.check_valid(card_target) == true
{
	self.card_config.take_effect(card_target)
	
	for(var i=0; i<array_length(list_target); i++)
	{
		self.card_effect.take_effect(list_target[i])
	}
}

self.card_effect.selected = false
self.card_config.selected = false

self.card_effect = pointer_null
self.card_target = pointer_null
self.card_config = pointer_null

self.list_target = []
