/// @description Reaction on the beginning of a turn.
// You can write your code in this editor

current_turn += 1

if ef_burn_active
{
	res += 20
	ef_burn_active = false
}
	
if ef_necrosis_active
	ef_necrosis_active = false
