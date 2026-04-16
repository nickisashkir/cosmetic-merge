# Helmet merging
execute if items entity @s weapon.mainhand minecraft:iron_helmet run function cosmetic_merge:merge/iron
execute if items entity @s weapon.mainhand minecraft:diamond_helmet run function cosmetic_merge:merge/diamond
execute if items entity @s weapon.mainhand minecraft:netherite_helmet run function cosmetic_merge:merge/netherite

# Chestplate merging
execute if items entity @s weapon.mainhand minecraft:iron_chestplate run function cosmetic_merge:merge/iron_chest
execute if items entity @s weapon.mainhand minecraft:diamond_chestplate run function cosmetic_merge:merge/diamond_chest
execute if items entity @s weapon.mainhand minecraft:netherite_chestplate run function cosmetic_merge:merge/netherite_chest

# Leggings merging
execute if items entity @s weapon.mainhand minecraft:iron_leggings run function cosmetic_merge:merge/iron_legs
execute if items entity @s weapon.mainhand minecraft:diamond_leggings run function cosmetic_merge:merge/diamond_legs
execute if items entity @s weapon.mainhand minecraft:netherite_leggings run function cosmetic_merge:merge/netherite_legs

# Boots merging
execute if items entity @s weapon.mainhand minecraft:iron_boots run function cosmetic_merge:merge/iron_boots
execute if items entity @s weapon.mainhand minecraft:diamond_boots run function cosmetic_merge:merge/diamond_boots
execute if items entity @s weapon.mainhand minecraft:netherite_boots run function cosmetic_merge:merge/netherite_boots

# Sword merging (real sword in mainhand, cosmetic in offhand)
execute if items entity @s weapon.mainhand minecraft:iron_sword run function cosmetic_merge:merge/iron_sword
execute if items entity @s weapon.mainhand minecraft:diamond_sword run function cosmetic_merge:merge/diamond_sword
execute if items entity @s weapon.mainhand minecraft:netherite_sword run function cosmetic_merge:merge/netherite_sword

# Axe merging (real axe in mainhand, cosmetic in offhand)
execute if items entity @s weapon.mainhand minecraft:iron_axe run function cosmetic_merge:merge/iron_axe
execute if items entity @s weapon.mainhand minecraft:diamond_axe run function cosmetic_merge:merge/diamond_axe
execute if items entity @s weapon.mainhand minecraft:netherite_axe run function cosmetic_merge:merge/netherite_axe
