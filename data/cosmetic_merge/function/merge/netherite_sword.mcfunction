summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,CustomName:"CosmeticMerge"}
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand set from entity @s equipment.offhand
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand.components.minecraft:enchantments set from entity @s SelectedItem.components.minecraft:enchantments
data modify entity @n[type=armor_stand,name=CosmeticMerge] equipment.mainhand.components.minecraft:attribute_modifiers set value [{id:"minecraft:base_attack_damage",type:"attack_damage",amount:7,operation:"add_value",slot:"mainhand"},{id:"minecraft:base_attack_speed",type:"attack_speed",amount:-2.4,operation:"add_value",slot:"mainhand"}]
item replace entity @s weapon.mainhand from entity @n[type=armor_stand,name=CosmeticMerge] weapon.mainhand
item replace entity @s weapon.offhand with minecraft:air
kill @n[type=armor_stand,name=CosmeticMerge]
tellraw @s {"text":"Netherite sword stats + enchantments applied to your cosmetic!","color":"green"}
playsound minecraft:block.anvil.use player @s ~ ~ ~ 1 1.5
