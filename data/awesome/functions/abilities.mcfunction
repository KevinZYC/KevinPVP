#character token: bread
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:3}]}

#ability 2: muck
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:13,Amplifier:28b}]}] resistance 18 28
effect clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={ActiveEffects:[{Id:11,Amplifier:28b}]}] regeneration
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_health 1 100
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] instant_damage 1 3
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 1 1
effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] water_breathing 2 28
#effect give @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] resistance 18 28
clear @a[nbt={Inventory:[{id:"minecraft:magma_block"}]},nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:diamond_chestplate"}]}] diamond_chestplate