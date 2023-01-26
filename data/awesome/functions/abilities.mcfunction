#character token: bread
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]},nbt=!{ActiveEffects:[{Id:11,Amplifier:28b}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:3}]}

#ability 2: muck
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b}]}] resistance 12 28
effect clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] regeneration
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] hotbar.0 with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:weakness"}}]} 1
execute as @e[type=arrow,nbt={Potion:"minecraft:weakness"}] run data merge entity @s {damage:5.0d}
execute as @e[type=arrow, nbt={Potion:"minecraft:strong_harming"}] at @s unless entity @a[nbt={ActiveEffects:[{Id:11,Amplifier:28b}]},distance=..8] run kill @s
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_health 1 100
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_damage 1 4
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 1 2
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] water_breathing 2 28
#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 18 28
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] diamond_chestplate