# Modernized Manhunt - Load Function
# Called when datapack is loaded/reloaded

# Initialize scoreboards
scoreboard objectives add mh.timer dummy "Manhunt Timer"
scoreboard objectives add mh.state dummy "Game State"
scoreboard objectives add mh.dragon dummy "Dragon Killed"
scoreboard objectives add mh.deaths deathCount

# Set initial game state (0 = stopped, 1 = countdown, 2 = active)
scoreboard players set #game mh.state 0
scoreboard players set #countdown mh.timer 0
scoreboard players set #dragon mh.dragon 0
scoreboard players set #dragon_prev mh.dragon 0
scoreboard players set #20 mh.timer 20

# Create teams if they dont exist
team add Hunters "Hunters"
team add Runner "Runner"

# Configure team colors
team modify Hunters color blue
team modify Hunters friendlyFire false
team modify Runner color red

# Create bossbar for countdown
bossbar add manhunt:countdown "Manhunt Countdown"
bossbar set manhunt:countdown color red
bossbar set manhunt:countdown style progress
bossbar set manhunt:countdown max 600
bossbar set manhunt:countdown visible false

tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"Datapack loaded! Use ","color":"gray"},{"text":"/function manhunt:start","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function manhunt:start"}},{"text":" to begin.","color":"gray"}]
