#character token: magma_block
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]},nbt=!{ActiveEffects:[{Id:11,Amplifier:28b}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:1},{id:fire_aspect,lvl:1}]}

#ability 1: passive
execute as @e store result score @s fire run data get entity @s Fire
execute as @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{ActiveEffects:[{Id:10,Amplifier:2b}]},nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]}] at @s if entity @e[scores={fire=1..},distance=..8] run effect give @s regeneration 2 2
execute as @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{ActiveEffects:[{Id:10,Amplifier:4b}]},nbt={ActiveEffects:[{Id:12,Amplifier:28b}]}] at @s if entity @e[scores={fire=1..},distance=..8] run effect give @s regeneration 2 4


#ability 2: 
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{id:"minecraft:diamond_helmet"}]}] ability2 200
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:diamond_helmet"}]},scores={ability2=..0}] hotbar.1 with minecraft:diamond_helmet
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:diamond_helmet"}]},nbt=!{ActiveEffects:[{Id:12,Amplifier:28b}]},nbt=!{ActiveEffects:[{Id:13,Amplifier:28b}]}] resistance 1 30
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:diamond_helmet"}]},nbt={ActiveEffects:[{Id:12,Amplifier:28b}]},nbt=!{ActiveEffects:[{Id:13,Amplifier:28b}]}] resistance 3 30
execute as @e[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:diamond_helmet"}]},nbt=!{ActiveEffects:[{Id:13,Amplifier:28b}]}] at @e[sort=nearest,limit=1,nbt=!{Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{Slot:103b,Count:1b,id:"minecraft:diamond_helmet"}]}] run fill ~ ~ ~ ~ ~ ~ fire replace air



#ult: muck
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] water_breathing 2 28
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 1 2 true

effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:39}]}] instant_health 1 100
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b,Duration:38}]}] instant_damage 1 4
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

#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 18 28
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] diamond_chestplate
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:diamond_helmet"}]}] diamond_helmet