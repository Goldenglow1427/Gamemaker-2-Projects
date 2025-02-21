### obj_battle_control

This object is automatically created by the beginning of a combat. It should automatically load the following information into the combat:

> - List of enemies, config cards, and effect cards;
> - Environmental effects & temporary buffs;

The code segment of input is as follows:

```cpp
// List of enemies and cards
enemy = global.private_list_of_enemy;
config_cards = private_list_of_config;
effect_cards = private_list_of_effect;
```

Then in the "Steps", it should be capable of hosting the game, and launch the game-end interface by the end.

- Alarm 0: when a combined skill is triggered;
- Alarm 1: when the player calls to move on to the next turn.

When the game ends, it should shows the reward, and returns to the map;