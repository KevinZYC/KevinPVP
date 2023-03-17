#character token: spider_eye
#slow attack, high damage, low health
item replace entity @a[nbt={Inventory:[{id:"minecraft:spider_eye"}]},nbt=!{Inventory:[{id:"minecraft:netherite_sword"}]}] hotbar.0 with netherite_sword{Enchantments:[{id:sharpness,lvl:8}]}
execute as @a[nbt={Inventory:[{id:"minecraft:spider_eye"}]}] run attribute @s minecraft:generic.max_health base set 32
effect give @a[nbt={Inventory:[{id:"minecraft:spider_eye"}]}] mining_fatigue 1 2 true

#ability1: flashbang
execute as @a at @s run execute at @e[type=area_effect_cloud,nbt={Potion:"minecraft:strong_slowness"},distance=..25] facing entity @s eyes run function spy:blind
kill @e[type=area_effect_cloud,nbt={Potion:"minecraft:strong_slowness"}]