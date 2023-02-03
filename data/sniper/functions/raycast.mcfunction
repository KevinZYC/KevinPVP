execute run particle ash
execute unless block ~ ~ ~ air positioned ^ ^ ^-0.2 run particle large_smoke
effect give @e[distance=0..0.7,type=!snowball] instant_damage 1 2
execute positioned ~ ~-0.7 ~ run effect give @e[distance=0..0.7,type=!snowball] instant_damage 1 2
execute positioned ~ ~-1.7 ~ run effect give @e[distance=0..0.3,type=!snowball] instant_damage 1 3
execute if block ~ ~ ~ air positioned ^ ^ ^0.1 run function sniper:raycast