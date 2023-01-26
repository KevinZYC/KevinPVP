#character token: feather
#weapon: netherite sword, sharpness 5
item replace entity @a[nbt={Inventory:[{id:"minecraft:feather"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:5}]}

#effects: strength 1
effect give @a[nbt={Inventory:[{id:"minecraft:feather"}]}] strength 1 0 true

#ability 1: dash
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={kill_trigger=1..}] ability1 0
execute as @e[type=arrow,nbt={Potion:"minecraft:slowness"},nbt={inGround:0b}] at @s run tp @p[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability1=90..100},distance=..4] ^ ^0.5 ^-0.5
execute as @e[type=arrow,nbt={Potion:"minecraft:slowness"}] at @s run effect give @p[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability1=90..100},distance=..4] slow_falling 4
execute as @e[type=arrow,nbt={Potion:"minecraft:slowness"}] at @s unless entity @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability1=90..100},distance=..4] run kill @s
kill @e[type=arrow,nbt={Potion:"minecraft:slowness"},nbt={inGround:1b}]
execute as @a[nbt={Inventory:[{id:"minecraft:feather"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] run scoreboard players set @s ability1 100
item replace entity @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability1=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:quick_charge",lvl:1}]}}]}] weapon.offhand with minecraft:crossbow{Enchantments:[{id:"minecraft:quick_charge",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:tipped_arrow",Count:1,tag:{Potion:"minecraft:slowness"}}]} 1

#ability 2: triple shot
execute as @a[nbt={Inventory:[{id:"minecraft:feather"}]},nbt={Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:multishot",lvl:1}]}}]}] run scoreboard players set @s ability2 20
item replace entity @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ability2=..0},nbt=!{Inventory:[{id:"minecraft:crossbow",tag:{Enchantments:[{id:"minecraft:multishot",lvl:1}]}}]}] hotbar.1 with minecraft:crossbow{Enchantments:[{id:"minecraft:multishot",lvl:1}],Charged:1b,ChargedProjectiles:[{id:"minecraft:arrow",Count:1b},{id:"minecraft:arrow",Count:1b},{id:"minecraft:arrow",Count:1b}]} 1

#ult: awakening
item replace entity @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ult=..0},nbt=!{Inventory:[{id:"minecraft:netherite_boots"}]}] hotbar.2 with netherite_boots{Enchantments:[{id:feather_falling,lvl:100},{id:binding_curse,lvl:1}]}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:feather"}]},nbt={Inventory:[{id:"minecraft:netherite_boots"}]},nbt=!{Inventory:[{Slot:100b,Count:1b,id:"minecraft:netherite_boots"}]}] ult 800
clear @a[nbt={Inventory:[{id:"minecraft:feather"}]},scores={ult=..600}] netherite_boots
effect clear @a[nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:netherite_boots"}]}] slow_falling
effect give @a[nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:netherite_boots"}]}] speed 1 1
effect give @a[nbt={Inventory:[{Slot:100b,Count:1b,id:"minecraft:netherite_boots"}]}] strength 1 5