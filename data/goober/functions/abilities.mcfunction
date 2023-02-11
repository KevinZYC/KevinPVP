#character token: glow_ink_sac
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:1},{id:fire_aspect,lvl:1}],display:{Name:"Goober"}}
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] run attribute @s minecraft:generic.max_health base set 40
effect give @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] haste 1 1
