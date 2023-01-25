#character token: stone
#weapon: netherite sword, sharpness 3
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:3}]}

#ability 1: lightning
execute as @e[type=arrow,nbt={Potion:"minecraft:luck"}] at @s run summon creeper ~ ~ ~ {ExplosionRadius:-5,Fuse:0}
kill @e[type=arrow,nbt={Potion:"minecraft:luck"}]
execute as @e[type=lightning_bolt] at @s run effect give @a[distance=..3] instant_damage 1 5
execute as @a[nbt={Inventory:[{id:"minecraft:stone"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ability1 1
item replace entity @a[nbt={Inventory:[{id:"minecraft:stone"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] weapon.offhand with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:luck"}}]} 1