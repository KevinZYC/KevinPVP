#token: sculk

#very slow attack, very high damage
item replace entity @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:25}]}
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] run attribute @s minecraft:generic.max_health base set 40

#effects: slow attack, darkness
effect give @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] mining_fatigue 1 3 true
effect give @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt=!{ActiveEffects:[{Id:31,Amplifier:5b}]}] darkness 1 0 true
effect clear @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt={ActiveEffects:[{Id:31,Amplifier:5b}]}] darkness

execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s unless entity @a[distance=0.1..10] run effect give @s slowness 1 0 true
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s if entity @a[distance=0.1..10] run effect give @s speed 1 0 true

#passive: situation awareness

#detect non-crouched players
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s run effect give @e[distance=0.1..8,scores={crouch=..4}] glowing 1

#detect sprinting players
scoreboard players set @a[scores={sprint=2..}] sprint 2
scoreboard players remove @a[scores={sprint=1..}] sprint 1

#execute at @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] run effect give @a[scores={sprint=1..}] glowing 2
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s run effect give @e[distance=0.1..25,scores={sprint=1..}] glowing 1

#ability 1: blind pulse

execute if entity @a[nbt={Inventory:[{id:"minecraft:sculk"}]},scores={ability1=..1}] as @a[nbt=!{Inventory:[{id:"minecraft:sculk"}]}] at @s run execute at @a[nbt={Inventory:[{id:"minecraft:sculk"}]},distance=..60,scores={ability1=..1}] facing entity @s eyes run function warden:blind
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:sculk"}]},scores={ability1=..0}] ability1 40


#ability 2: sonic boom
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ability2 90
item replace entity @a[nbt={Inventory:[{id:"minecraft:sculk"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] hotbar.1 with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1b,tag:{Potion:"minecraft:strength"}}]} 1

execute as @e[type=arrow,nbt={Potion:"minecraft:strength"}] at @s as @p[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s anchored eyes run function warden:sonic_boom

kill @e[type=arrow,nbt={Potion:"minecraft:strength"}]

#ult: unblind
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt={Inventory:[{id:"minecraft:potion"}]}] run scoreboard players set @s ult 700
item replace entity @a[nbt={Inventory:[{id:"minecraft:sculk"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:potion"}]}] hotbar.2 with minecraft:potion{CustomPotionEffects:[{Id:31,Amplifier:5,Duration:200}]} 1
clear @a glass_bottle