#basic game mechanics
setworldspawn 0 0 0
scoreboard players remove @a[scores={ability1=1..}] ability1 1
scoreboard players remove @a[scores={ability2=1..}] ability2 1
scoreboard players remove @a[scores={ult=1..}] ult 1

#misc cleanups
clear @a crossbow{Charged:0b}
clear @a glass_bottle
kill @e[type=arrow,nbt={life:10s}]
kill @e[type=item]
execute as @e[type=arrow] run data merge entity @s {pickup:0b}
execute as @e[type=spectral_arrow] run data merge entity @s {pickup:0b}
execute as @e[nbt={ShotFromCrossbow:1b}] run data merge entity @s {PierceLevel:10}
kill @e[type=zoglin]

#general saturation
effect give @a saturation 1 1 true
execute as @a run attribute @s minecraft:generic.max_health base set 40
#effect give @a[nbt=!{ActiveEffects:[{Id:21}]}] health_boost 999999 4 true

#passive healing
scoreboard players set @a[scores={damage_taken=1..}] heal_timer 60
scoreboard players set @a[scores={damage_taken=1..}] damage_taken 0
scoreboard players remove @a[scores={heal_timer=1..}] heal_timer 1

effect give @a[scores={heal_timer=..0},nbt=!{ActiveEffects:[{Id:10}]}] regeneration 2 1 true
#call abilities
function assassin:abilities
function large:abilities
function awesome:abilities

#post abilities
scoreboard players remove @a[scores={kill_trigger=1..}] kill_trigger 1

#awesome abilities
execute at @e[nbt={ActiveEffects:[{Id:18}]}] at @s setblock ~ ~ ~ fire