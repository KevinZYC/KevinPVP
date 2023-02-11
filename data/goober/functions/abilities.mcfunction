#character token: glow_ink_sac
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:1},{id:fire_aspect,lvl:1}],tag:{display:{Name:'{"text":"Goober"}'}}}
item replace entity @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] weapon.offhand with carrot_on_a_stick
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] run attribute @s minecraft:generic.max_health base set 40

#effect give @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] haste 1 1

#basic: goo
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={goo=1},nbt=!{ActiveEffects:[{Id:13,Amplifier:38b}]},nbt={SelectedItem:{id:"minecraft:netherite_sword"}}] at @s run summon area_effect_cloud ~ ~ ~ {Particle:"glow_squid_ink",Radius:4.5,Duration:40,RadiusPerTick:0,Effects:[{Id:2b,Amplifier:0b,Duration:10}]}
effect give @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={goo=1},nbt=!{ActiveEffects:[{Id:13,Amplifier:38b}]},nbt={SelectedItem:{id:"minecraft:netherite_sword"}}] water_breathing 1 38

scoreboard players reset @a goo