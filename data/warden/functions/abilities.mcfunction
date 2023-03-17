#token: sculk

#very slow attack, very high damage
item replace entity @a[nbt={Inventory:[{id:"minecraft:sculk"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:25}]}
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] run attribute @s minecraft:generic.max_health base set 40

#effects: slow attack, darkness
effect give @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] mining_fatigue 1 3 true
effect give @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] darkness 1 0 true

#passive: situation awareness

#detect non-crouched players
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s run effect give @e[distance=0.1..8,scores={crouch=..4}] glowing 1

#detect sprinting players
scoreboard players set @a[scores={sprint=2..}] sprint 2
scoreboard players remove @a[scores={sprint=1..}] sprint 1

#execute at @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] run effect give @a[scores={sprint=1..}] glowing 2
execute as @a[nbt={Inventory:[{id:"minecraft:sculk"}]}] at @s run effect give @e[distance=0.1..18,scores={sprint=1..}] glowing 1