execute unless score @s cm_april matches 1.. run function cosmetic_merge:april_showers_safe_give
execute if score @s cm_april matches 1.. run tellraw @s {"text":"You've already claimed the April Showers Collection this month!","color":"red"}
