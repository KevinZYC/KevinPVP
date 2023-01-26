#character token: stone
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:3}]}
#execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]}] run attribute @s minecraft:generic.max_health base set 2

#ability 1: poison bomb
execute as @e[type=arrow,nbt={Potion:"minecraft:luck"},nbt={inGround:1b}] at @s run summon creeper ~ ~ ~ {ExplosionRadius:1,Fuse:0,ActiveEffects:[{Id:7,Amplifier:1b}]}
execute as @e[type=arrow,nbt={Potion:"minecraft:luck"}] run data merge entity @s {damage:0.0d}
#execute as @e[type=creeper] at @s run effect give @p[distance=..6,nbt={Inventory:[{id:"minecraft:stone"}]}] slow_falling 2
#execute as @e[type=creeper] at @s run execute as @p[distance=..6,nbt={Inventory:[{id:"minecraft:stone"}]}] at @s positioned ~ ~1 ~ if block ^ ^ ^-1 air run tp @s ^ ^ ^-1
kill @e[type=arrow,nbt={Potion:"minecraft:luck"},nbt={inGround:1b}]
execute as @e[type=lightning_bolt] at @s run effect give @a[distance=..3] instant_damage 1 5
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ability1 100
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] weapon.offhand with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:luck"}}]} 1
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability1=89},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] weapon.offhand with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:10}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:luck"}}]} 1

#ability 2: rocket jump
effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] slow_falling 2
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] at @s positioned ~ ~1.2 ~ run summon creeper ^ ^0.1 ^0.5 {Fuse:0,ExplosionRadius:-1}
clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] chainmail_boots
effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] slow_falling 6
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] at @s positioned ~ ~1.2 ~ run summon creeper ^ ^0.1 ^0.5 {Fuse:0,ExplosionRadius:-1}
clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] chainmail_leggings
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:chainmail_boots"}]}] ability2 100
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=..0}] hotbar.1 with chainmail_boots
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=95}] hotbar.1 with chainmail_leggings
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]}] at @s unless block ~ ~-1 ~ air run effect clear @s slow_falling
