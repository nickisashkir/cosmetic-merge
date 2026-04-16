summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,CustomName:"CosmeticMerge"}
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand set from entity @s equipment.chest
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand.components.minecraft:enchantments set from entity @s SelectedItem.components.minecraft:enchantments
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand.components.minecraft:attribute_modifiers set value [{id:"armor",type:"armor",amount:6,operation:"add_value"}]
item replace entity @s armor.chest from entity @n[type=armor_stand,name=CosmeticMerge] weapon.mainhand
item replace entity @s weapon.mainhand with minecraft:air
kill @n[type=armor_stand,name=CosmeticMerge]
tellraw @s {"text":"Iron armor + enchantments applied to your cosmetic!","color":"green"}
playsound minecraft:block.anvil.use player @s ~ ~ ~ 1 1.5
