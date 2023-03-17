#character token: stone
#fast attack, low damage, normal health
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:2}]}
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]}] run attribute @s minecraft:generic.max_health base set 40
effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]}] haste 1 2 true

#ability 1: explosive javelin
#execute as @e[type=arrow,nbt={Potion:"minecraft:strong_poison"},nbt={HasBeenShot:0b}] run data merge entity @s {damage:0.0s}

execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:snowball"}]}] run scoreboard players set @s ability1 160
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:snowball"}]}] weapon.offhand with minecraft:snowball 1
execute at @e[type=snowball,nbt={HasBeenShot:0b}] run execute as @p[nbt={Inventory:[{id:"minecraft:stone"}]}] at @s anchored eyes run summon endermite ^ ^ ^1.1 {NoAI:1b,ActiveEffects:[{Id:7,Amplifier:0b,Duration:9999},{Id:11,Amplifier:3b,Duration:9999},{Id:14,Amplifier:0b,Duration:9999}]}
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]}] at @s anchored eyes positioned ^ ^ ^1 run data modify entity @e[distance=..1,type=endermite,sort=nearest,limit=1] Rotation set from entity @s Rotation
kill @e[type=snowball,nbt={HasBeenShot:1b}]
execute at @e[type=endermite] run particle explosion ^ ^ ^
execute at @e[type=endermite] run particle cloud ^ ^ ^
execute at @e[type=endermite] run particle cloud ^ ^ ^-0.2
execute at @e[type=endermite] run particle cloud ^ ^ ^-0.4
execute at @e[type=endermite] run particle cloud ^ ^ ^-0.6

execute as @e[type=endermite] at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.8
execute as @e[type=endermite] at @s if block ^ ^ ^1 air positioned ~ ~ ~ run tp @e[distance=..1.1,type=!endermite,type=!armor_stand,type=!arrow,type=!snowball] @s
execute as @e[type=endermite] at @s if block ^ ^ ^1 air positioned ~ ~-1 ~ run tp @e[distance=..1.1,type=!endermite,type=!armor_stand,type=!arrow,type=!snowball] @s

execute as @e[type=endermite] at @s if entity @e[distance=..1.1,type=!endermite,type=!armor_stand,type=!arrow,type=!snowball] store result entity @s Rotation[1] float 1 run data get entity @s Rotation[1] 0
execute as @e[type=endermite] at @s if entity @e[distance=..1.1,type=!endermite,type=!armor_stand,type=!arrow,type=!snowball] run effect clear @s resistance

execute as @e[type=endermite] at @s unless block ^ ^ ^1 air if entity @e[distance=..1,type=!endermite,type=!armor_stand,type=!arrow,type=!snowball] run summon creeper ^ ^ ^0.1 {Fuse:0b,ExplosionRadius:2}
execute as @e[type=endermite] at @s unless block ^ ^ ^1 air run kill @s


# ability 2: blast grenade
#execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:luck"}] run execute at @e[type=!area_effect_cloud,type=!creeper,distance=..2] run summon creeper ~ ~ ~ {ExplosionRadius:-5,Fuse:0b}
execute as @e[type=area_effect_cloud,nbt={Potion:"minecraft:luck"}] at @s run execute at @e[type=!area_effect_cloud,type=!creeper,distance=..4,sort=nearest,limit=1] positioned ~ ~1.2 ~ facing entity @s feet run summon creeper ^ ^0.1 ^0.5 {Fuse:0,ExplosionRadius:-1}
#execute as @e[type=area_effect_cloud,nbt={Potion:"minecraft:luck"}] at @s run effect give @e[distance=..4] instant_damage 1 1
execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:luck"}] run particle explosion_emitter
kill @e[type=area_effect_cloud,nbt={Potion:"minecraft:luck"}]

scoreboard players set @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:lingering_potion"}]}] ability2 100
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=..0}] hotbar.1 with lingering_potion{Potion:"minecraft:luck"}
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=..0}] hotbar.2 with lingering_potion{Potion:"minecraft:luck"}

#passive: crouch to glide
effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt=!{ActiveEffects:[{Id:28}]},scores={crouch=1..}] water_breathing 1 11 true
effect clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={ActiveEffects:[{Id:13,Amplifier:11b}]},scores={crouch=..0}] slow_falling
#effect clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={ActiveEffects:[{Id:13,Amplifier:11b}]},scores={crouch=..0}] jump_boost
effect clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={crouch=..0},nbt={ActiveEffects:[{Id:13,Amplifier:11b}]}] water_breathing

effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={ActiveEffects:[{Id:13,Amplifier:11b}]}] slow_falling 1 11

#ult rocket launcher
execute at @e[type=arrow,nbt={Potion:"minecraft:strong_poison"},nbt={inGround:1b}] run summon creeper ~ ~0.5 ~ {ExplosionRadius:5b, Fuse:0b}
execute at @e[type=arrow,nbt={Potion:"minecraft:strong_poison"},nbt={inGround:0b}] run particle flash
execute at @e[type=arrow,nbt={Potion:"minecraft:strong_poison"},nbt={inGround:0b}] run particle explosion
kill @e[type=arrow,nbt={Potion:"minecraft:strong_poison"},nbt={inGround:1b}]

execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ult 750
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] hotbar.3 with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:strong_poison"}}]} 1


#ability 2: rocket jump
#effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] slow_falling 2
#execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] at @s positioned ~ ~1.2 ~ run summon creeper ^ ^0.1 ^0.5 {Fuse:0,ExplosionRadius:-1}
#clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:chainmail_boots"}]}] chainmail_boots
#effect give @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] slow_falling 6
#execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] at @s positioned ~ ~1.2 ~ run summon creeper ^ ^0.1 ^0.5 {Fuse:0,ExplosionRadius:-1}
#clear @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{Slot:101b,Count:1b,id:"minecraft:chainmail_leggings"}]}] chainmail_leggings
#scoreboard players set @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:chainmail_boots"}]}] ability2 100
#item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=..0}] hotbar.1 with chainmail_boots
#item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability2=95}] hotbar.1 with chainmail_leggings
#execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]}] at @s unless block ~ ~-1 ~ air run effect clear @s slow_falling
