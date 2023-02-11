#character token: blackstone
#fast attack, normal damage, normal health
item replace entity @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:5}]}
execute as @a[nbt={Inventory:[{id:"minecraft:blackstone"}]}] run attribute @s minecraft:generic.max_health base set 40
effect give @a[nbt={Inventory:[{id:"minecraft:blackstone"}]}] haste 1 1 true

#ability 2: Shadow step
item replace entity @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:netherite_helmet"}]}] weapon.offhand with netherite_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:blackstone"}]},nbt={Inventory:[{id:"minecraft:netherite_helmet"}]},nbt=!{Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] ability2 10
execute as @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] at @s positioned ^ ^ ^4.1 run function reaper:recursive

#clear @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:netherite_helmet"}]}] netherite_helmet