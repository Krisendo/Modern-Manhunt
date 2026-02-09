# Modernized Manhunt - Start Function
# Begins the manhunt game

advancement revoke @a only manhunt:hit_hunter

# Check if already running
execute if score #game mh.state matches 1..2 run tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"Game is already running! Use ","color":"red"},{"text":"/function manhunt:stop","color":"yellow"},{"text":" first.","color":"red"}]
execute if score #game mh.state matches 1..2 run return fail

# Check if teams have players
execute unless entity @a[team=Runner,limit=1] run tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"No Runner assigned! Use ","color":"red"},{"text":"/team join Runner <name>","color":"yellow"}]
execute unless entity @a[team=Runner,limit=1] run return fail

execute unless entity @a[team=Hunters,limit=1] run tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"No Hunters assigned! Use ","color":"red"},{"text":"/team join Hunters <name>","color":"yellow"}]
execute unless entity @a[team=Hunters,limit=1] run return fail

# Set world spawn and all players' spawnpoint at executor's location (whoever ran /function manhunt:start)
setworldspawn ~ ~ ~
spawnpoint @a ~ ~ ~

# Set Worldborder to 12000 to prevent running too far
worldborder set 12000

# Set gamemode to adventure mode
gamemode adventure @a

# Make everyone freeze until the time is over
execute as @a run attribute @s minecraft:movement_speed base set 0
execute as @a run attribute @s minecraft:jump_strength base set 0

# Sound
playsound minecraft:entity.blaze.ambient master @a ~ ~ ~ 0.8 0.8

# Disable PVP during countdown (1.21.11+ uses minecraft:pvp; run it first)
gamerule minecraft:pvp false
gamerule pvp false

# Clear all players' inventories and items
clear @a
kill @e[type=minecraft:item]

# Set Hunters' waypoint_transmit_range to 0 so they cannot transmit waypoints (1.21.6+)
execute as @a[team=Hunters] run attribute @s minecraft:waypoint_transmit_range base set 0

# Give all players saturation and regeneration (2 seconds = 40 ticks)
effect give @a minecraft:saturation 2 100 true
effect give @a minecraft:regeneration 2 100 true

# Reset dragon / dragon_prev flags
scoreboard players set #dragon mh.dragon 0
scoreboard players set #dragon_prev mh.dragon 0

# Set countdown timer (30 seconds = 600 ticks)
scoreboard players set #countdown mh.timer 600

# Set game state to countdown
scoreboard players set #game mh.state 1

# Show and configure bossbar
bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e30s"
bossbar set manhunt:countdown value 600
bossbar set manhunt:countdown visible true
bossbar set manhunt:countdown players @a

tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"Game starting! ","color":"green"},{"text":"30 seconds before the Hunt begins!","color":"yellow"}]
title @a[team=Runner] title {"text":"PREPARE TO RUN!","color":"red","bold":true}
title @a[team=Hunters] title {"text":"PREPARE TO HUNT!","color":"blue","bold":true}
