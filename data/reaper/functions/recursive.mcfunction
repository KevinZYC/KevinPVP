#particle soul ~ ~1 ~
clear @s netherite_helmet
execute if entity @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]}] at @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]},sort=nearest,limit=1] run function reaper:teleport
execute if entity @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]}] run effect give @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]},sort=nearest,limit=1] instant_damage
execute if entity @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]}] run effect give @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]},sort=nearest,limit=1] blindness 3
execute if entity @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]}] run effect clear @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]},sort=nearest,limit=1] bad_omen
execute unless entity @e[distance=0.1..4,nbt={ActiveEffects:[{Id:31,Amplifier:10b}]}] positioned ^ ^ ^0.5 run function reaper:recursive