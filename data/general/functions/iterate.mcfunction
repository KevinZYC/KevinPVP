#basic game mechanics
execute as @a run spawnpoint @s 0 -60 0
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
#effect give @a[nbt=!{ActiveEffects:[{Id:21}]}] health_boost 999999 4 true

#passive healing
scoreboard players set @a[scores={damage_taken=1..}] heal_timer 60
scoreboard players set @a[scores={damage_taken=1..}] damage_taken 0
scoreboard players remove @a[scores={heal_timer=1..}] heal_timer 1

effect give @a[scores={heal_timer=..0},nbt=!{ActiveEffects:[{Id:10}]}] regeneration 1 2 true
#call abilities
function assassin:abilities
function large:abilities
function awesome:abilities
function tank:abilities
function sniper:abilities
function bruiser:abilities
function reaper:abilities

#post abilities
scoreboard players remove @a[scores={kill_trigger=1..}] kill_trigger 1

#crouch mechanics
scoreboard players set @a[scores={crouch=1}] crouch 5
scoreboard players remove @a[scores={crouch=1..}] crouch 1
scoreboard players set @a[scores={crouch=3}] crouch 0

#spawning
execute as @e[type=armor_stand] run data merge entity @s {Marker:1b,Invulnerable:1b,Invisible:1b}

execute positioned 0 -60 0 run effect give @a[distance=..12] resistance 1 4 true
execute positioned 0 -60 0 run effect give @a[distance=..12] regeneration 2 50 true
execute positioned 0 -60 0 run clear @a[distance=..3]
execute positioned 0 -60 0 run execute as @a[distance=..3] run attribute @s minecraft:generic.max_health base set 20

#targets
effect give @e[type=vindicator] resistance 1 1
effect give @e[type=vindicator] slowness 1 3

#damaging
function general:damage