# Monster Design Worksheet

结局1：Normal Ending, fight against the dead prince in this castle; fight against "Ferlon, the Corrupted Prince";
结局2：False Good Ending, found that the castle itself is cursed; fight against "Mischiereno, the Castle Transformed";
结局3：True Ending, saved the prince from the castle's curse; fight against, "Ferlon Martinden, the Conqueror"

Summons need to have **Taunt Values**;

## List of Mechanisms

### CORE MECHANICS

Each monster should have its own:

| Term        | Explained                                        |
| ----------- | ------------------------------------------------ |
| max_hp & hp | Max hitpoints by default, and current hitpoints; |
| atk         | Base attack damage;                              |
| res         | Art resistance in general;                       |
| sp[]        | Array of skill points, by skills;                |

- `Dmg`:

  Use a struct to pass information;

  ```cpp
  {
      amount: (int),
      type: (int),
  }
  ```

- `sp`:

  Use a struct to pass information;

  ```cpp
  {
      type: (int),
      amount: (int),
      init: (int) // Init <= Amount
  }
  ```

- `DOT`:

  Maintains a list of structs:

  ```
  {
  ·	turn: (int),
  	amount: (int),
  	type: (int)
  }
  ```

### Side Mechanisms

- `shield`: by layers, counter one instance of any damage;

- `burn_dmg`: by layers, when accumulated to 10, deals huge one instance damage;

  - Enemies: deals 30 art damage, loses 20 RES;
  - Allies: deals 10 magic damage, applies 3 art DOT over 5 rounds;

- `necrosis_dmg`: by layers, when accumulated to 10:

  - Enemies: deals 15 true damage, reset the SP for most skills to 0;
  - Allies: starting Energy reduce 50% for 2 turns;

- `ef_stun`: by turns, each turn reduce by 1;

  - Enemies: skip all actions in this turn, but keeps SP input;
  - Allies: ban all actions in this turn;

- `protection`: maintains a list of structs:

  ```c++
  {
  	turn: (int),
  	amount: (int), // Only numbers in range (0, 100]
      type: (int)
  }
  ```

- `vulnerability`: maintains a list of structs:

  ```cpp
  {
      turn: (int),
      amount: (int),
      type: (int)
  }
  ```

- `enfeebleness`: maintains a list of structs:

  ```cpp
  {
      turn: (int),
      amount: (int),
      type: (int)
  }
  ```

- `power`: deals that percent more of the damage:

  ```cpp
  {
      turn: (int),
      amount: (int),
      type: (int)
  }
  ```

  

## Character & Summons

The character should have the following characteristics:

- HP: the current health value;
- Shards: the current amount of memory shards, required to **cast cards, create & heal summons**;
- EXP: gained from battle as loot;

The character itself should have the following methods:

- `f_take_damage(dmg)`

  Let the player to take damage

---

Summons: each summon has some unique abilities. Ability costs mana to cast;

### D1: Combat Summons

> Combat summons help with battle through various damaging skills.

- 时空行客之魂

- 暗界镇灵之魂【Elemental】

  HP: 70	ATK: 30	RES: 50	TAUNT:  30~3	RARE: 4

  Skill A (2) - Deals 3 `NECROSIS-DMG` and applies 30% `VULNERABILITY` to all enemies;

  Skill B (3) - Poisons all enemies: they permanently loses 10 HP by the beginning of a turn;

  Skill C (5) - Can only be casted once per battle: immediately triggers the `NECROSIS` state of all enemies (if their `necrosis-active=true`, reset it and then trigger again); applies 100% `FRAGILE` for 2 turns and STUN for 1 turn;

  Talent - Whenever the `NECROSIS-DMG` is triggered, enemy loses additional 10% of their max HP (as true dmg);

### D2: Support Summons

> Support summons buff the allies and de-buff the enemies to better secure victory.



### D3: Defend Summons

> Defend summons attract opponent's attention, and protect allied units.

- 卫兵之魂（Soul of a Sentinel）

  HP: 30	ATK: 10	RES: 20	TAUNT: 0~3	RARE: 1

  Skill A (1): Gain 10 TAUNT for this round.

- 仙人掌之魂

  HP: 25	ATK: 5	RES: 30	TAUNT: 5~3	RARE: 1

  Skill A (1): Gain 5 TAUNT for this round. When attacked, reflect `5 PHY DMG` to the damager.

- 守护者之魂

  HP: 20	ATK: 10	RES: 30	TAUNT: 0~3	RARE: 1

  Skill A (1): Grants 1 SHIELD and 10 TAUNT for this round.

  

- 巨树之魂

  HP: 50	ATK: 5	RES: 40	TAUNT: 10~3	RARE: 2

  Skill A (3): Recover 10 health by the end of this turn.

- 石像之魂

  HP: 60	ATK: 10	RES: 20	TAUNT: 10~3	RARE: 2

  Skill A (1): Gain 30 RES until the end of this turn;

  Skill B (2): Until the end of this turn: gain 10 TAUNT, when attacked, reflect `3 NECROSIS-DMG` to the attacker;

- 护佑者之魂

  HP: 30	ATK: 20	RES: 30	TAUNT: 0~3	RARE: 2

  Skill A (2) - Until the end of this turn: the unit with highest TAUNT gains `10 RES`;

  Talent - Allied units take `20%` less elemental damage;

- 天使之魂

  HP: 40	ATK: 10	RES: 10	TAUNT: 0~3	RARE: 2

  Skill A (2) - Recover `10 HP` to the most wounded summon;

  Skill B (2) - Recover `5 HP` to the player;

  

- 影哨之魂【Control】

  HP: 10	ATK: 10	RES: 10	TAUNT: -10~3	RARE: 3

  Skill A (2) - Let the enemy with the **least HP percentage** gains `60% ENFEEBLENESS`;

  Skill B (3) - Sacrifices this soul: deals `10 DMG` to all enemies, and stuns them for 1 round;

  Talent - When this unit is on battlefield: friendly members gain `20% physical dodge` and `20% art dodge`;

- 参天神树之魂【Recovery】

  HP: 80	ATK: 20	RES: 20	TAUNT: 30~3	RARE: 3

  Skill A (1) - Gains 2 additional mana by the starting of next turn;

  Skill B (3) - Recover `5 HP` to all allies & players, and additional `5 HP` to the one with least health percent;

  Skill C (0) - All allies gain `20% PROTECTION`;

- 导灵僧之魂【Elemental】

  HP: 50	ATK: 5	RES: 40	TAUNT: 0~3	RARE: 3

  Skill A (2) - Until next turn: All allies receive 50% less ELEMENT-DMG and gain 20% `PROTECTION`;

  Skill B (3) - Grants 3 layer of shield to the summon with highest TAUNT;

  Skill C (3) - Grants 1 layer of shield to all summons;

  Talent - Enter the battlefield with 3 layers of SOUL ARMOR; When holding SOUL ARMOR:

  - Casting skills consume 1 layer of SOUL ARMOR instead of mana;
  - Gain `50% PROTECTION` and 10 TAUNT;

- 盾卫之魂【Offense】

  HP: 100	ATK: 20	RES: 20	TAUNT: 40~3	RARE: 3

  Skill A (1) - Until next turn: This unit gains 30% `PROTECTION`;

  Skill B (2) - Until next turn: The talent of this unit also deals 3 `NECROSIS-DMG`;

  Skill C (2) - Until next turn: The talent of this unit also deals 3 `BURN-DMG`;

  Talent - When this unit is attacked, it deals 10 damage to the attacker as counter attack;

  

- 黄金圣盾之魂【Elemental, **Legendary**】

  HP: 90	ATK: 20	RES: 80	TAUNT: 40~3	RARE: 4

  Skill A (2) - Until next turn: all allies gain 50% `PROTECTION`;

  Skill B (3) - Until next turn: this unit gain 70% `PROTECTION`; when an ally takes damage, shares 70% of their damage taken (calculate enemy effects like ENFEEBLE, ignore target effects like VULNERABILITY);

  Skill C (4) - Can only be used once per game, grants all allies 3 layers of SHIELD; for the rest of the game, whenever a shield breaks, deals 3 `BURN-DMG` to all allies; 

  Talent - When this unit is on battlefield: all allies receives 50% less ELEMENTAL DMG;

### D4: Special Summons

- 腐化邪神之魂
- 噬梦幽魂之魂
- 迷乱漩涡之魂
- 亡灵法师之魂

## Monsters

### D1: Regular Monsters

- 带盾护卫（Shielded Guard）

  > The most low-level defenders of the castle. Don't know magic, but the armors can protect them well.

  Auto - Normal attack, deals 5 damage;

  Skill - Gain `1 shield`; 2 auto recovery;

  Talent 1 - Begins with `1 shield`;

- 自动人偶

  > Some robot structures left in the castle. You are amazed to see that some of them are still working.

  Auto - Sleep;

  Skill 1 - Charged attack, deals 10 damage; 2 def recovery;

  Talent 1 - Auto change to charged attack since `Round 4`;

- 见习法师

  > New trained wizards in the castle.

  Auto - Deals 4 magic damage;

  Skill - Deals 3 splash damage / applies 50% fragile for 1 turn / applies 2 burn damage;

- 地堡老鼠

  > Mice in the base.

  Auto - Deals 1 damage;

- 凋败骷髅

  Auto - Deals 5 damage & 2 `necrosis-dmg`;

- 亡灵射手

  Auto - Deals 7 damage & 2 `necrosis-dmg`;

  Talent - prioritize the player as target;

### D2: Elite Monsters

- 宫廷药师

  Auto - Deals 6 splash magic damage;

  Skill - Recovers 10 hp of an ally, grants it 50% protection / applies 5 burn damage and 50% vulnerability (4 auto-sp);

  Talent - When on battlefield, allies recover additional 0.5 sp per turn;
  
- 微物学者

  Auto - Grants +1 ATK to all friendly "地堡老鼠"

  Skill - Summon 1 地堡老鼠 if there are enough space (2 auto-sp);

- 凋亡术士

  Auto - Deals 4 art damage and 3 `necrosis-dmg`;

  Skill 1 - Applies 5 `necrosis-dmg` on all allies;

  Talent - Whenever a "necrosis-dmg" on allies is ignited, this unit deals 3 more art damage;

- 久战指挥官

  Auto - Let one enemy gains 100% `power` for 1 round;

  Talent - When on battlefield, all allies gain 20% `protection` and 20% `power` by default;

## List of Battles

Variation of battles: 4-5-6-6-6, excluding boss fights;

### L1: Entering the Castle

- 护卫队

  2 带盾护卫

  1 自动人偶

  > Emergency: 2 extra 自动人偶 will appear;

- 破败街道

  3 地堡老鼠

  1 凋败骷髅 / 1 亡灵射手

  > Emergency: always 2 亡灵射手 + 3 地堡老鼠 / 3 凋败骷髅 + 2 地堡老鼠;

- 紧急炼药

  3 见习法师

  > Emergency: 1 见习法师 replaced by 1 宫廷药师;

- 窃贼团伙

  1 自动人偶

  1 带盾护卫

  1 见习法师

  > Emergency: 1 more 自动人偶 will appear.

### L2: Broken Castle Hall

- 生物实验室

  1 微物学者

  2 地堡老鼠

  > Emergency: 地堡老鼠 gains significantly increased max hp (+50%);

- 舞会

  2 带盾护卫

  2 自动人偶

  > Emergency: 1 additional 久战指挥官 will appear;

### L3: The Grand Hall

### L4: Corrupted Watchtower

- 破败舞厅

  2 凋败骷髅

  2 亡灵射手

  1 凋亡术士

  > Emergency: 1 亡灵射手 will be replaced by 1 凋亡术士

### L5: The Throne Room

### L6: Desert Illusion

