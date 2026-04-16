# Cosmetic Merge

A Minecraft datapack that lets players apply real armor and weapon stats (plus enchantments) to cosmetic items. Designed for use with the Filament mod so that players can transfer the stats and enchantments of their vanilla gear onto custom cosmetic models without losing functionality.

Built for Minecraft 26.1 with Filament and Polymer. Originally created for The Remnants server.

## What It Does

The core idea is that cosmetics should not force players to choose between looks and survivability. This datapack lets players upgrade their cosmetic items by sacrificing real enchanted gear. The cosmetic keeps its custom model and display name, but gains the stats and enchantments of the real item.

Supported slots:
- Helmets, chestplates, leggings, boots
- Swords and axes

Supported tiers:
- Iron
- Diamond
- Netherite

Also includes a monthly drop claim system used for seasonal cosmetic collections (the April Showers barrel on The Remnants).

Leather Dye
- Also supports you adding iron/diamond/netherite stats to leather gear so you can keep the cool thousands of dye possibilities of leather. 

## Requirements

- Minecraft 26.1 (Fabric)
- Filament mod and its dependencies
- Polymer

This datapack relies on virtual items provided by Filament to function. It does not work on vanilla Minecraft alone.

## Installation

1. Download the latest release zip
2. Place the zip in your world's `datapacks` folder
3. Run `/reload` in-game or restart the server
4. Verify the datapack loaded with `/datapack list`

The scoreboard objective used for claim tracking is registered automatically on load, so no manual setup is needed.

## How It Works

### Armor Merge

1. Player wears a cosmetic in the slot they want to upgrade (head, chest, legs, or feet)
2. Player holds a real iron, diamond, or netherite piece of the matching slot in their main hand
3. Player runs `/function cosmetic_merge:merge`
4. The cosmetic takes on the enchantments and armor stats of the held item
5. The real item is consumed

### Weapon Merge

Weapon merging uses a different slot setup because both the cosmetic and the real weapon compete for the main hand.

1. Player holds a real iron, diamond, or netherite sword or axe in their main hand
2. Player puts the cosmetic sword or axe in their off hand
3. Player runs `/function cosmetic_merge:merge`
4. The cosmetic takes on the enchantments and attack stats of the real weapon
5. The cosmetic ends up in the main hand, off hand is cleared

### Stat Values

All values match vanilla Minecraft gear stats.

**Helmets**
- Iron: 2 armor
- Diamond: 3 armor, 2 toughness
- Netherite: 3 armor, 3 toughness, 0.1 knockback resistance

**Chestplates**
- Iron: 6 armor
- Diamond: 8 armor, 2 toughness
- Netherite: 8 armor, 3 toughness, 0.1 knockback resistance

**Leggings**
- Iron: 5 armor
- Diamond: 6 armor, 2 toughness
- Netherite: 6 armor, 3 toughness, 0.1 knockback resistance

**Boots**
- Iron: 2 armor
- Diamond: 3 armor, 2 toughness
- Netherite: 3 armor, 3 toughness, 0.1 knockback resistance

**Swords** (cosmetic base is iron_sword, so bonuses stack on top of vanilla 6 damage / 1.6 speed)
- Iron: 6 attack damage, 1.6 attack speed
- Diamond: 7 attack damage, 1.6 attack speed
- Netherite: 8 attack damage, 1.6 attack speed

**Axes**
- Iron: 9 attack damage, 0.9 attack speed
- Diamond: 9 attack damage, 1.0 attack speed
- Netherite: 10 attack damage, 1.0 attack speed

## Commands

### Player Commands

`/function cosmetic_merge:merge`
Runs the merge logic. Detects what item is held and what cosmetic is worn or held, then applies the correct stat transfer.

### Admin Commands

`/function cosmetic_merge:test`
Quick check that the datapack loaded correctly.

`/function cosmetic_merge:april_showers`
Gives the player the April Showers collection barrel. Enforces one claim per player.

`/function cosmetic_merge:april_showers_safe`
Gives a safer variant of the barrel with only proven cosmetic items (no experimental ones). Same one-claim enforcement.

`/function cosmetic_merge:april_showers_give`
Direct give without the claim check. For admin testing only.

`/function cosmetic_merge:april_showers_safe_give`
Same as above for the safe variant.

`/function cosmetic_merge:reset_april_claims`
Clears all April Showers claims server-wide. Use this to reset a monthly cycle or to let all players re-claim.

`/scoreboard players get <playername> cm_april`
Check if a specific player has claimed. Returns 1 if claimed, "none" if unclaimed.

`/scoreboard players set <playername> cm_april 1`
Manually mark a player as having claimed.

`/scoreboard players reset <playername> cm_april`
Clear one player's claim so they can claim again.

## Command Block Setup

For automated claim stations, use this command on an impulse block triggered by a button or pressure plate:

```
execute as @p[distance=..3] unless score @s cm_april matches 1.. run function cosmetic_merge:april_showers
```

The `unless score` check prevents spam when players walk past after already claiming.

For merge stations, an impulse block with a button works well:

```
execute as @p[distance=..3] run function cosmetic_merge:merge
```

The merge function is safe to run repeatedly since it only does anything if the player has valid items in the expected slots.

## How The Armor Stand Trick Works

Filament virtual items cannot have their components modified directly with `data get` commands due to how Polymer serves them to the client. However, `data modify` does work when the item is on an entity. This datapack uses a hidden, invisible, no-gravity armor stand named `CosmeticMerge` as a workspace:

1. Summon the armor stand at the player's position
2. Copy the cosmetic item onto the armor stand's main hand slot
3. Modify the copy's enchantments and attribute modifiers
4. Replace the player's cosmetic slot with the modified copy
5. Clear the real item from the player's main hand (or off hand for weapons)
6. Kill the armor stand

This is the core mechanism behind every merge function.

## Troubleshooting

**Merge does nothing when I run the command**
Check that the cosmetic is actually in the expected slot (worn for armor, off hand for weapons) and that the real item is a vanilla iron, diamond, or netherite piece matching the slot type. Filament-enchanted items cannot act as the "real" item source.

**Enchantments do not transfer**
The held item may not have any enchantments to copy. Try with an enchanted piece first to confirm the merge is working.

**Stuck or broken item**
Clear the slot manually with:
```
/item replace entity <playername> armor.<head|chest|legs|feet> with minecraft:air
/item replace entity <playername> weapon.mainhand with minecraft:air
```

**Scoreboard not tracking claims**
Verify the objective exists with `/scoreboard objectives list`. If `cm_april` is missing, run `/reload` to re-trigger the load function.

**Ghost armor stand sitting around**
Clean up any stuck merge armor stands with:
```
/kill @e[type=armor_stand,name=CosmeticMerge]
```

## Extending The Pack

### Adding a new seasonal drop

1. Create a new give function like `/function cosmetic_merge:may_wildlife_give` with the give command and a scoreboard set at the top
2. Create a gatekeeper function `/function cosmetic_merge:may_wildlife` that checks the score before calling give
3. Add the new objective to `load.mcfunction`: `scoreboard objectives add cm_may dummy`
4. Create a reset function if you want admin reset capability
5. Wire a command block to the gatekeeper with the same `unless score` pattern

### Adding a new armor or weapon slot

The armor stand trick generalizes to any slot. Copy an existing merge function (for example `iron_chest.mcfunction`), swap the equipment slot references, and add a dispatcher line in `merge.mcfunction`. All the work is in matching the slot name and attribute values to vanilla equivalents.

## Credits

Built by NickyStar for The Remnants server. https://theremnants.gg/

Thanks to the Filament and Polymer teams for making the mods this depends on.
