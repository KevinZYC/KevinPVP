#execute run particle flame
execute positioned ~ ~-0.7 ~ run execute as @s[distance=0..0.7,type=!snowball] at @s run function spy:testvision
execute positioned ~ ~-1.7 ~ run execute as @s[distance=0..0.3,type=!snowball] at @s run function spy:testvision
execute if block ~ ~ ~ air positioned ^ ^ ^0.1 run function spy:blind