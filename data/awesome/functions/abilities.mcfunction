#character token: magma_blockross
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]},nbt=!{ActiveEffects:[{Id:11,Amplifier:28b}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:1},{id:fire_aspect,lvl:1}]}
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:totem_of_undying"}]}] weapon.offhand with minecraft:totem_of_undying


#passive
execute as @e store result score @s fire run data get entity @s Fire
execute as @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{ActiveEffects:[{Id:10,Amplifier:3b}]},nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]}] at @s if entity @e[nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]},scores={fire=1..},distance=..8] run effect give @s regeneration 2 3
execute as @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{ActiveEffects:[{Id:10,Amplifier:4b}]},nbt={ActiveEffects:[{Id:12,Amplifier:28b}]}] at @s if entity @e[nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]},scores={fire=1..},distance=..8] run effect give @s regeneration 2 4

#2nd passive???
kill @a[scores={totem=9}]
effect give @a[scores={totem=10..}] resistance 1 4
scoreboard players set @a[scores={totem=1}] totem 169
scoreboard players set @a[scores={totem=8}] totem 0
scoreboard players remove @a[scores={totem=1..}] totem 1


#ability 1:


#ability 2: 
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{id:"minecraft:blaze_powder"}]}] ability2 160
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:blaze_powder"}]},scores={ability2=..0}] hotbar.1 with minecraft:blaze_powder
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:blaze_powder"}]},nbt={ActiveEffects:[{Id:12,Amplifier:28b}]}] hotbar.1 with minecraft:blaze_powder
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},scores={crouch=5},nbt={Inventory:[{id:"minecraft:blaze_powder"}]},nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]},nbt=!{ActiveEffects:[{Id:11,Amplifier:28b}]}] resistance 1 30
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},scores={crouch=5},nbt={Inventory:[{id:"minecraft:blaze_powder"}]},nbt={ActiveEffects:[{Id:12,Amplifier:28b}]},nbt=!{ActiveEffects:[{Id:11,Amplifier:28b}]}] resistance 3 30
execute as @e[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{ActiveEffects:[{Id:13,Amplifier:28b}]},nbt={ActiveEffects:[{Id:11,Amplifier:30b}]}] at @e[sort=nearest,limit=1,nbt=!{Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{Slot:103b,Count:1b,id:"minecraft:blaze_powder"}]}] run fill ~ ~ ~ ~ ~ ~ fire replace air
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},scores={crouch=5},nbt={Inventory:[{id:"minecraft:blaze_powder"}]}] water_breathing 1 26
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:8b,Count:1b,id:"minecraft:crossbow"}]}] speed 1 2
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:26b,Duration:10}]},nbt=!{ActiveEffects:[{Id:13,Amplifier:28b}]}] hotbar.1 with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:water_breathing"}}]} 1
execute as @e[type=arrow,nbt={Potion:"minecraft:water_breathing"},nbt={inGround:1b}] at @s run effect give @e[distance=..3] slowness 2 28

#ult: muck
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] water_breathing 2 28
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 1 1 true

effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:39}]}] instant_health 1 100
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:38}]}] instant_damage 1 3
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:37}]}] resistance 12 28
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:37}]}] fire_resistance 17 28

#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b}]}] fire_resistance 17 28
effect clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] regeneration
effect clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] weakness
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] hotbar.0 with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:weakness"}}]} 1
execute as @e[type=arrow,nbt={Potion:"minecraft:weakness"}] run data merge entity @s {damage:5.0d}
execute as @e[type=arrow, nbt={Potion:"minecraft:weakness"}] at @s unless entity @a[nbt={ActiveEffects:[{Id:11,Amplifier:28b}]},distance=..8] run kill @s
#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_health 1 100
#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_damage 1 4
#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 1 2
execute as @e[type=arrow,nbt={Potion:"minecraft:weakness"},nbt={inGround:1b}] at @s run fill ~ ~ ~ ~ ~ ~ fire replace air
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{id:"minecraft:diamond_chestplate"}]}] ult 1000
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:diamond_chestplate"}]},scores={ult=..0}] hotbar.2 with minecraft:diamond_chestplate
execute as @e[nbt={ActiveEffects:[{Id:18}]}] at @s run fill ~ ~ ~ ~ ~ ~ fire replace air

#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 18 28
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] diamond_chestplate
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},scores={crouch=5},nbt={Inventory:[{id:"minecraft:blaze_powder"}]}] blaze_powder