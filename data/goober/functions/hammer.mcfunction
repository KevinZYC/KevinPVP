#summon area_effect_cloud ~ ~ ~ {Particle:"glow_squid_ink",Radius:1,Duration:40,RadiusPerTick:0,Effects:[{Id:2b,Amplifier:0b,Duration:10}]}
execute unless block ~ ~ ~ air run summon area_effect_cloud ~ ~ ~ {Particle:"squid_ink",Radius:4,Duration:40,RadiusPerTick:0,Potion:"minecraft:water_breathing"}
execute if block ~ ~ ~ air positioned ^ ^ ^0.5 run function goober:hammer