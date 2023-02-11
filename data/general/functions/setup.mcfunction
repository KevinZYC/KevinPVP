scoreboard objectives add ability1 dummy
scoreboard objectives add ability2 dummy
scoreboard objectives add ult dummy
scoreboard objectives add kill_trigger totalKillCount
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken
scoreboard objectives add crouch minecraft.custom:minecraft.sneak_time
scoreboard objectives add fire dummy
scoreboard objectives add heal_timer dummy
scoreboard players set @a ability1 50
scoreboard players set @a ability2 50
scoreboard players set @a ult 50
scoreboard players set @a damage_taken 0
scoreboard players set @a heal_timer 0
scoreboard players set @a kill_trigger 0
scoreboard players set @a crouch 0

#awesome
scoreboard objectives add totem minecraft.used:minecraft.totem_of_undying 
scoreboard players set @a totem 0

#goober
scoreboard objectives add goo minecraft.used:minecraft.carrot_on_a_stick