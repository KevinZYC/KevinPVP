execute facing entity @s feet if block ^ ^ ^2 air if block ^ ^ ^1 air run tp @s ^ ^ ^2
execute facing entity @s feet unless block ^ ^ ^2 air if block ^ ^ ^1 air run tp @s ^ ^ ^1
execute facing entity @s feet unless block ^ ^ ^2 air unless block ^ ^ ^1 air run tp @s ^ ^0.2 ^
execute facing entity @s feet if block ^ ^ ^2 air unless block ^ ^ ^1 air run tp @s ^ ^0.2 ^
scoreboard players set @s ability2 200