#character token: bread
#high damage, low attack speed, high health
item replace entity @a[nbt={Inventory:[{id:"minecraft:bread"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:8}]}
execute as @a[nbt={Inventory:[{id:"minecraft:bread"}]}] run attribute @s minecraft:generic.max_health base set 48
effect give @a[nbt={Inventory:[{id:"minecraft:bread"}]}] mining_fatigue 1 1 true


#ability 1: chain hook
execute as @e[type=arrow,nbt={Potion:"minecraft:strong_slowness"}] at @s unless entity @a[distance=..20,nbt={Inventory:[{id:"minecraft:bread"}]},scores={ability1=130..150}] run kill @s
execute as @e[type=arrow,nbt={Potion:"minecraft:strong_slowness"}] run data merge entity @s {ShotFromCrossbow:0b,PierceLevel:0,damage:0.5d}
execute as @e[nbt={ActiveEffects:[{Id:2,Amplifier:3b,Duration:39}]}] at @s at @p[nbt={Inventory:[{id:"minecraft:bread"}]},scores={ability1=130..148}] facing entity @s feet positioned ^ ^ ^1 run tp @s ~ ~ ~
effect give @a[nbt={Inventory:[{id:"minecraft:bread"}]},scores={ability1=130}] strength 1 2
execute as @a[nbt={Inventory:[{id:"minecraft:bread"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ability1 150
item replace entity @a[nbt={Inventory:[{id:"minecraft:bread"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] weapon.offhand with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:strong_slowness"}}]} 1

#ability 2: super heal
item replace entity @a[nbt={Inventory:[{id:"minecraft:bread"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:leather_helmet"}]}] hotbar.1 with leather_helmet{Enchantments:[{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:bread"}]},nbt={Inventory:[{id:"minecraft:leather_helmet"}]},nbt=!{Inventory:[{Slot:103b,Count:1b,id:"minecraft:leather_helmet"}]}] ability2 150
effect give @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:leather_helmet"}]}] regeneration 3 4
clear @a[nbt={Inventory:[{Slot:103b,Count:1b,id:"minecraft:leather_helmet"}]},scores={ability2=147..149}] leather_helmet

#ability 3: grav kill
item replace entity @a[nbt={Inventory:[{id:"minecraft:bread"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:leather_chestplate"}]}] hotbar.2 with leather_chestplate{Enchantments:[{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:bread"}]},nbt={Inventory:[{id:"minecraft:leather_chestplate"}]},nbt=!{Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"}]}] ult 800
effect give @a[nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"}]}] slowness 4 42
#effect give @a[nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"}]}] jump_boost 4 128
effect give @a[nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"}]}] resistance 4 2
clear @a[nbt={Inventory:[{Slot:102b,Count:1b,id:"minecraft:leather_chestplate"}]},nbt={ActiveEffects:[{Id:2,Amplifier:42b}]}] leather_chestplate
execute as @e[type=!arrow,type=!spectral_arrow,type=!trident,type=!allay,type=!armor_stand] at @s if entity @a[distance=2..8,nbt={ActiveEffects:[{Id:2,Amplifier:42b}]}] facing entity @p[distance=2..8,nbt={ActiveEffects:[{Id:2,Amplifier:42b}]}] feet run tp @s ^ ^ ^0.3
execute as @e[type=!arrow,type=!spectral_arrow,type=!trident,type=!allay,type=!armor_stand] at @s if entity @a[distance=0.1..8,nbt={ActiveEffects:[{Id:2,Amplifier:42b}]}] run effect give @s wither 1 10
execute as @a[nbt={ActiveEffects:[{Id:2,Amplifier:42b,Duration:1}]}] at @s run effect give @e[distance=..5,nbt=!{ActiveEffects:[{Id:2,Amplifier:42b,Duration:1}]}] instant_damage 1 2
execute as @a[nbt={ActiveEffects:[{Id:2,Amplifier:42b,Duration:1}]}] at @s run particle explosion_emitter