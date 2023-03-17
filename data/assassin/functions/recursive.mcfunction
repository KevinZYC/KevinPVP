clear @s golden_helmet
effect clear @s water_breathing
playsound minecraft:entity.player.attack.sweep ambient @a ~ ~ ~
particle sonic_boom ^ ^ ^
execute if block ^ ^ ^0.5 air run tp @s ^ ^ ^0.1
scoreboard players remove @s ability1 1
execute unless entity @s[scores={ability1=..95}] positioned ^ ^ ^0.5 if block ~ ~ ~ air run function assassin:recursive
execute positioned ~ ~-1 ~ run effect give @e[nbt=!{Inventory:[{id:"minecraft:feather"}]},distance=..2] instant_damage 1 1
execute positioned ~ ~-1 ~ run effect give @e[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability=..92},distance=..2] instant_damage 1 1