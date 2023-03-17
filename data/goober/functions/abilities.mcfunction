#character token: glow_ink_sac
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:1},{id:fire_aspect,lvl:1}],tag:{display:{Name:'{"text":"Goober"}'}}}
item replace entity @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] weapon.offhand with carrot_on_a_stick
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] run attribute @s minecraft:generic.max_health base set 40

#effect give @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] haste 1 1

#basic: goo
#execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={goo=1},nbt=!{ActiveEffects:[{Id:13,Amplifier:38b}]},nbt={SelectedItem:{id:"minecraft:netherite_sword"}}]
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={goo=1,charges=..8},nbt=!{ActiveEffects:[{Id:13,Amplifier:38b}]},nbt={SelectedItem:{id:"minecraft:netherite_sword"}}] at @s positioned ^ ^2 ^2 run function goober:recursive
effect give @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={goo=1,charges=..8},nbt=!{ActiveEffects:[{Id:13,Amplifier:38b}]},nbt={SelectedItem:{id:"minecraft:netherite_sword"}}] water_breathing 1 38
execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:water_breathing"}] run effect give @e[distance=..4,nbt=!{ActiveEffects:[{Id:19}]},nbt=!{Inventory:[{id:"minecraft:glow_ink_sac"}]}] poison 1 1
execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:water_breathing"}] run effect give @e[distance=..4,nbt=!{ActiveEffects:[{Id:19}]},nbt=!{Inventory:[{id:"minecraft:glow_ink_sac"}]}] slowness 1 0
execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:water_breathing"}] run effect give @e[distance=..4,nbt=!{ActiveEffects:[{Id:19}]},nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]}] speed 1 0
    #reload
    scoreboard players set @a[scores={charges=0}] reload 10
    scoreboard players set @a[scores={crouch=0}] reload 10
    scoreboard players set @a[scores={reload=0}] reload 10
    scoreboard players remove @a[scores={reload=1}] charges 1
    scoreboard players add @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},nbt={Inventory:[{id:"minecraft:ink_sac"}]},nbt={ActiveEffects:[{Id:13,Amplifier:38b,Duration:20}]},scores={charges=..8}] charges 1


#ability 1: big hammer
execute as @a[nbt={Inventory:[{id:"minecraft:glow_ink_sac"}]},scores={hammer=1}] at @s facing entity @s feet run summon area_effect_cloud ^ ^ ^ {Particle:"glow_squid_ink",Radius:4,Duration:40,RadiusPerTick:0,Potion:"minecraft:water_breathing"}
kill @e[type=experience_bottle]

scoreboard players reset @a goo
scoreboard players reset @a hammer