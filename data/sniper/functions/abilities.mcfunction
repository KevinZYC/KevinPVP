#character token: bread
#weapon: bow, power 4
item replace entity @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},nbt=!{Inventory:[{id:"minecraft:bow"}]}] weapon.offhand with bow{Enchantments:[{id:power,lvl:4}]}

#ability 1: supercharged shot
item replace entity @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:harming"}}]}] hotbar.0 with minecraft:tipped_arrow{Potion:"minecraft:harming"} 1
item replace entity @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ability1=1..98}] hotbar.0 with minecraft:arrow 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},nbt={Inventory:[{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:harming"}}]}] ability1 100
execute as @e[type=arrow,nbt={Potion:"minecraft:harming"},nbt={HasBeenShot:0b}] store result entity @s Motion[0] double 0.03 run data get entity @s Motion[0] 100
execute as @e[type=arrow,nbt={Potion:"minecraft:harming"},nbt={HasBeenShot:0b}] store result entity @s Motion[1] double 0.03 run data get entity @s Motion[1] 100
execute as @e[type=arrow,nbt={Potion:"minecraft:harming"},nbt={HasBeenShot:0b}] store result entity @s Motion[2] double 0.03 run data get entity @s Motion[2] 100
execute as @e[type=arrow,nbt={Potion:"minecraft:harming"}] run data merge entity @s {damage:3.0d}
execute as @e[type=arrow,nbt=!{ShotFromCrossbow:1b}] run data merge entity @s {crit:0b}

#ability 2: tracker shot
item replace entity @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:spectral_arrow"}]}] hotbar.1 with minecraft:spectral_arrow 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},nbt={Inventory:[{id:"minecraft:spectral_arrow"}]}] ability2 120
execute at @e[type=spectral_arrow,nbt={inGround:1b}] run effect give @e[distance=..8,nbt=!{Inventory:[{id:"minecraft:gold_ingot"}]}] glowing 8
execute at @e[type=spectral_arrow,nbt={inGround:1b}] run effect give @e[distance=..8,scores={ability2=..100}] glowing 8
execute at @e[type=spectral_arrow,nbt={inGround:1b}] run effect give @e[distance=..8,nbt=!{Inventory:[{id:"minecraft:gold_ingot"}]}] darkness 4
execute at @e[type=spectral_arrow,nbt={inGround:1b}] run effect give @e[distance=..8,scores={ability2=..100}] darkness 4
kill @e[type=spectral_arrow,nbt={life:5s}]
execute as @e[type=spectral_arrow] run data merge entity @s {PierceLevel:10}

#ult: sonic boom
item replace entity @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:swiftness"}}]}] hotbar.2 with minecraft:tipped_arrow{Potion:"minecraft:swiftness"} 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ult=..0},nbt={Inventory:[{id:"minecraft:tipped_arrow",Count:1b,tag:{Potion:"minecraft:swiftness"}}]}] ult 300

give @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},scores={ult=..1},nbt={Inventory:[{id:"minecraft:tipped_arrow",Count:1b,tag:{Potion:"minecraft:swiftness"}}]}] minecraft:tipped_arrow{Potion:"minecraft:swiftness"} 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:gold_ingot"}]},nbt={Inventory:[{id:"minecraft:tipped_arrow",Count:2b,tag:{Potion:"minecraft:swiftness"}}]}] ult 300

#execute as @e[type=arrow,nbt={Potion:"minecraft:swiftness"}] at @s as @p[nbt={Inventory:[{id:"minecraft:gold_ingot"}]}] at @s positioned ~ ~1 ~ run summon allay ^ ^ ^3 {ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647}]}
execute at @e[type=arrow,nbt={Potion:"minecraft:swiftness"}] as @p[nbt={Inventory:[{id:"minecraft:gold_ingot"}]}] at @s anchored eyes positioned ^ ^ ^0.8 run function sniper:raycast
kill @e[type=arrow,nbt={Potion:"minecraft:swiftness"}]
execute as @e[type=allay,nbt=!{NoAI:1b}] run data modify entity @s Rotation set from entity @p[nbt={Inventory:[{id:"minecraft:gold_ingot"}]}] Rotation
#execute as @e[type=allay,nbt={NoAI:1b}] at @s run tp @s ^ ^ ^2

#execute as @e[type=allay,nbt=!{NoAI:1b}] at @s run function sniper:raycast

#execute as @e[type=allay] run data merge entity @s {NoAI:1b,Silent:1b}
#execute as @e[type=allay,nbt={NoAI:1b}] at @s run effect give @e[distance=..1.5,type=!allay] instant_damage 1 2
#execute as @e[type=allay,nbt={NoAI:1b}] at @s run effect give @e[distance=..1.5,type=!allay] glowing 1
#execute as @e[type=allay,nbt={NoAI:1b}] at @s run effect give @e[distance=..1.5,type=!allay] darkness 4
#execute as @e[type=allay,nbt={NoAI:1b}] at @s run particle sonic_boom
#effect give @e[type=allay] instant_damage 1 1

