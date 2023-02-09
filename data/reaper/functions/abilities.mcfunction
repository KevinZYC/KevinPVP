#character token: blackstone
#weapon: netherite sword, sharpness 6
item replace entity @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:6}]}

#ability 2: Shadow step
item replace entity @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:netherite_helmet"}]}] weapon.offhand with netherite_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},nbt={Inventory:[{id:"minecraft:netherite_helmet"}]},nbt=!{Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] ability2 10
execute as @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] at @s positioned ^ ^ ^4.1 run function reaper:recursive

#clear @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] netherite_helmet