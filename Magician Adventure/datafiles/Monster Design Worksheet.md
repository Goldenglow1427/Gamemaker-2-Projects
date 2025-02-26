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

  - Enemies: deals 15 magic damage;
  - Allies: deals 10 magic damage, applies 3 DOT over 5 rounds;

- `necrosis_dmg`: by layers, when accumulated to 10:

  - Enemies: reset the SP for most skills to 0;
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

  Skill - Charged attack, deals 10 damage; 2 def recovery;

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

