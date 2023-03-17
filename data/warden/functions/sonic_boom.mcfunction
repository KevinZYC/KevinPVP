execute run particle sonic_boom
effect give @e[distance=0..0.7,type=!snowball] instant_damage 1 2
execute positioned ~ ~-0.7 ~ run effect give @e[distance=0..0.7,type=!snowball] instant_damage 1 2

execute positioned ~ ~ ~ run effect give @e[distance=0..1.2,type=!snowball] instant_damage 1 1
execute positioned ~ ~ ~ run effect give @e[distance=0..1.2,type=!snowball] glowing 1 1

execute positioned ~ ~-1.7 ~ run effect give @e[distance=0..0.3,type=!snowball] instant_damage 1 2
execute if entity @a[distance=..100] positioned ^ ^ ^0.1 run function warden:sonic_boom