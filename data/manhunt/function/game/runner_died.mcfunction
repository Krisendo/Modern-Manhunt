# Modernized Manhunt - Runner Died
# Called when Runner dies - Hunters win

# Reset death count for the runner
scoreboard players set @s mh.deaths 0

# End the game
scoreboard players set #game mh.state 0

# Hide bossbar
bossbar set manhunt:countdown visible false

# Display Game Over
title @a title {"text":"Game Over","color":"yellow","bold":true}

# Show win/lose subtitles
title @a[team=Hunters] subtitle {"text":"You Win!","color":"green","bold":true}
title @a[team=Runner] subtitle {"text":"You Lose!","color":"red","bold":true}

# Put runner in spectator mode
gamemode spectator @a[team=Runner]

# Play sounds: Hunters win, Runner loses
playsound minecraft:ui.toast.challenge_complete master @a[team=Hunters] ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup master @a[team=Hunters] ~ ~ ~ 0.8 1.2
playsound minecraft:entity.wither.death master @a[team=Runner] ~ ~ ~ 0.6 0.8

tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"The Hunters have won! ","color":"blue"},{"text":"Runner has been eliminated!","color":"gray"}]
