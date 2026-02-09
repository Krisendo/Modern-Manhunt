# Modernized Manhunt - Countdown Tick Handler
# Decrements countdown and updates bossbar

# Decrement timer
scoreboard players remove #countdown mh.timer 1

# Update bossbar value
execute store result bossbar manhunt:countdown value run scoreboard players get #countdown mh.timer

# Calculate seconds remaining for display
execute store result score #seconds mh.timer run scoreboard players get #countdown mh.timer
scoreboard players operation #seconds mh.timer /= #20 mh.timer

# Update bossbar name every second (when timer is divisible by 20)
execute if score #countdown mh.timer matches 580 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e29s"
execute if score #countdown mh.timer matches 560 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e28s"
execute if score #countdown mh.timer matches 540 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e27s"
execute if score #countdown mh.timer matches 520 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e26s"
execute if score #countdown mh.timer matches 500 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e25s"
execute if score #countdown mh.timer matches 480 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e24s"
execute if score #countdown mh.timer matches 460 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e23s"
execute if score #countdown mh.timer matches 440 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e22s"
execute if score #countdown mh.timer matches 420 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e21s"
execute if score #countdown mh.timer matches 400 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e20s"
execute if score #countdown mh.timer matches 380 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e19s"
execute if score #countdown mh.timer matches 360 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e18s"
execute if score #countdown mh.timer matches 340 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e17s"
execute if score #countdown mh.timer matches 320 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e16s"
execute if score #countdown mh.timer matches 300 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e15s"
execute if score #countdown mh.timer matches 280 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e14s"
execute if score #countdown mh.timer matches 260 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e13s"
execute if score #countdown mh.timer matches 240 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e12s"
execute if score #countdown mh.timer matches 220 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e11s"
execute if score #countdown mh.timer matches 200 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e10s"
execute if score #countdown mh.timer matches 180 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e9s"
execute if score #countdown mh.timer matches 160 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e8s"
execute if score #countdown mh.timer matches 140 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e7s"
execute if score #countdown mh.timer matches 120 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e6s"
execute if score #countdown mh.timer matches 100 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e5s"
execute if score #countdown mh.timer matches 80 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e4s"
execute if score #countdown mh.timer matches 60 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e3s"
execute if score #countdown mh.timer matches 40 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e2s"
execute if score #countdown mh.timer matches 20 run bossbar set manhunt:countdown name "§c§lManhunt Starts in: §e1s"

# Play sound at specific intervals
execute if score #countdown mh.timer matches 100 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
execute if score #countdown mh.timer matches 80 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
execute if score #countdown mh.timer matches 60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.2
execute if score #countdown mh.timer matches 40 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.4
execute if score #countdown mh.timer matches 20 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1.6

# Check if countdown finished
execute if score #countdown mh.timer matches 0 run function manhunt:game/countdown_end
