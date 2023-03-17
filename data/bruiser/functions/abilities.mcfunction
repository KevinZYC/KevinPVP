#character token: iron ingot
#slow attack, high damage, average health
item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:8}]}
item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt=!{Inventory:[{id:"minecraft:bow"}]}] weapon.offhand with bow{Enchantments:[{id:power,lvl:4},{id:punch,lvl:2}]}
execute as @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}] run attribute @s minecraft:generic.max_health base set 40
effect give @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}] mining_fatigue 1 2 true

#ability 1: rocket punch
item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:strong_harming"}}]}] hotbar.1 with minecraft:tipped_arrow{Potion:"minecraft:strong_harming"} 1
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:strong_harming"}}]}] ability1 100

execute as @e[type=arrow,nbt={Potion:"minecraft:strong_harming"},nbt={inGround:0b}] at @s run tp @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability1=90..100},distance=..4] ^ ^0.5 ^-0.5
execute as @e[type=arrow,nbt={Potion:"minecraft:strong_harming"}] at @s run effect give @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability1=90..100},distance=..4] slow_falling 1
execute as @e[type=arrow,nbt={Potion:"minecraft:strong_harming"}] at @s unless entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability1=90..100},distance=..4] run kill @s
execute as @e[type=arrow,nbt={Potion:"minecraft:strong_harming"},nbt={HasBeenShot:0b}] store result entity @s Motion[1] double 1 run data get entity @s Motion[1] 0

#ability 2: seismic slam
item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:splash_potion"}]}] hotbar.2 with splash_potion{Potion:"minecraft:awkward"}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{id:"minecraft:splash_potion"}]}] ability2 125
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run tp @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},distance=..4] ^ ^1 ^-0.5
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},distance=..4] slow_falling 1
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt=!{ActiveEffects:[{Id:28}]},distance=..3] levitation 1 18
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt=!{Inventory:[{id:"minecraft:iron_ingot"}]},distance=..3] levitation 1 18
effect clear @e[nbt={ActiveEffects:[{Id:25,Amplifier:18b,Duration:18}]}] levitation
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt=!{ActiveEffects:[{Id:28}]},distance=..3] darkness 3
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt=!{Inventory:[{id:"minecraft:iron_ingot"}]},distance=..3] darkness 3
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt=!{ActiveEffects:[{Id:28}]},distance=..3] instant_damage
execute as @e[type=potion,nbt={Item:{tag:{Potion:"minecraft:awkward"}}}] at @s run effect give @e[nbt=!{Inventory:[{id:"minecraft:iron_ingot"}]},distance=..3] instant_damage

#ult: meteor strike
item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:iron_boots"}]}] hotbar.3 with iron_boots{Enchantments:[{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{id:"minecraft:iron_boots"}]},nbt=!{Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] ult 500
effect give @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] resistance 5 69
effect give @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] levitation 1 15
effect give @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] slow_falling 2

execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:69b,Duration:60}]}] at @s positioned ~ ~1.1 ~ run summon creeper ^ ^ ^-1 {Fuse:0b,ExplosionRadius:6}
execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:69b,Duration:59}]}] at @s positioned ~ ~1.2 ~ run summon creeper ^ ^ ^-1 {Fuse:0b,ExplosionRadius:6}
#execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:69b,Duration:58}]}] at @s positioned ~ ~1.3 ~ run summon creeper ^ ^ ^-1 {Fuse:0b,ExplosionRadius:6}
#execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:69b,Duration:57}]}] at @s positioned ~ ~1.5 ~ run summon creeper ^ ^ ^-1 {Fuse:0b,ExplosionRadius:6}

execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:70b,Duration:17}]},nbt=!{ActiveEffects:[{Id:25}]}] run effect clear @s resistance
execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:69b}]},nbt={OnGround:1b},nbt=!{ActiveEffects:[{Id:25}]}] run effect give @s resistance 1 70
execute as @a[nbt={ActiveEffects:[{Id:11,Amplifier:70b,Duration:19}]}] at @s run summon creeper ~ ~1 ~ {Fuse:0b,ExplosionRadius:4}


clear @a[nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]},nbt={ActiveEffects:[{Id:11,Amplifier:69b}]}] iron_boots

#unused
#item replace entity @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:iron_boots"}]}] hotbar.2 with iron_boots{Enchantments:[{id:binding_curse,lvl:1}]}
#scoreboard players set @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{id:"minecraft:iron_boots"}]},nbt=!{Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] ability2 150
#execute as @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] at @s positioned ^ ^ ^3 run effect give @e[distance=..4] levitation 1 12
#execute as @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] at @s positioned ^ ^ ^3 run effect give @e[distance=..4] slow_falling 2
#execute as @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] at @s positioned ^ ^ ^3 run effect give @e[distance=..4] water_breathing 2 69
#effect give @a[nbt={Inventory:[{id:"minecraft:iron_ingot"}]},nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]}] slow_falling 4
#clear @a[nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:iron_boots"}]},scores={ability2=147..149}] iron_boots