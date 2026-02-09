# Modernized Manhunt - Countdown End
# Called when 30-second countdown completes

# Set game state to active
scoreboard players set #game mh.state 2

# Enable PVP (1.21.11+ uses minecraft:pvp; run it first so it always executes)
gamerule minecraft:pvp true
gamerule pvp true

# Hide bossbar
bossbar set manhunt:countdown visible false

# Notify players
playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.5 1.5
tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"The time is up! ","color":"red"},{"text":"The hunt has begun!","color":"yellow"}]

# Unfreeze players
execute as @a run attribute @s minecraft:movement_speed base set 0.10000000149011612
execute as @a run attribute @s minecraft:jump_strength base set 0.41999998688697815

# Set gamemode survival
execute as @a run gamemode survival @s