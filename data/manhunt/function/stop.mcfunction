# Modernized Manhunt - Stop Function
# Cancels the game and cleans up

# Set game state to stopped
scoreboard players set #game mh.state 0
scoreboard players set #countdown mh.timer 0

# Disable bossbar
bossbar set manhunt:countdown visible false

# Enable PVP (1.21.11+ uses minecraft:pvp; run it first)
gamerule minecraft:pvp true
gamerule pvp true

# Sound
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 0.8 0.5

# Restore Hunters' waypoint_transmit_range (default 64; 1.21.6+)
execute as @a[team=Hunters] run attribute @s minecraft:waypoint_transmit_range base reset

# Display stopped message
title @a title {"text":"Manhunt Stopped","color":"gray","bold":true}
tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"Game has been stopped.","color":"gray"}]

# Set all players to survival mode
execute as @a run gamemode survival @s

# Unfreezes all players
execute as @a run attribute @s minecraft:movement_speed base set 0.10000000149011612
execute as @a run attribute @s minecraft:jump_strength base set 0.41999998688697815