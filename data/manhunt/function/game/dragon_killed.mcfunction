# Modernized Manhunt - Dragon Killed
# Called when Ender Dragon is killed - Runner wins

# Set flags to prevent re-triggering
scoreboard players set #dragon mh.dragon 1
scoreboard players set #dragon_prev mh.dragon 0

# End the game
scoreboard players set #game mh.state 0

# Hide bossbar
bossbar set manhunt:countdown visible false

# Display Game Over
title @a title {"text":"Game Over","color":"yellow","bold":true}

# Show win/lose subtitles (Runner wins, Hunters lose)
title @a[team=Runner] subtitle {"text":"You Win!","color":"green","bold":true}
title @a[team=Hunters] subtitle {"text":"You Lose!","color":"red","bold":true}

# Play sounds: Runner wins, Hunters lose
playsound minecraft:ui.toast.challenge_complete master @a[team=Runner] ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup master @a[team=Runner] ~ ~ ~ 0.8 1.2
playsound minecraft:entity.ender_dragon.death master @a[team=Hunters] ~ ~ ~ 0.6 1

tellraw @a ["",{"text":"[Manhunt] ","color":"gold"},{"text":"The Runner has won! ","color":"red"},{"text":"The Ender Dragon has been slain!","color":"gray"}]
