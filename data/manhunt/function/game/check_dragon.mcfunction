# Modernized Manhunt - Check Dragon Death
# Only triggers when dragon was present last tick and is now gone (just died).

# Mark presence this tick
execute in minecraft:the_end if entity @e[type=minecraft:ender_dragon] run scoreboard players set #dragon_prev mh.dragon 1
# If dragon just disappeared and we haven't triggered yet, Runner wins
execute in minecraft:the_end unless entity @e[type=minecraft:ender_dragon] if score #dragon_prev mh.dragon matches 1 if score #dragon mh.dragon matches 0 run function manhunt:game/dragon_killed
# Clear prev so we don't retrigger
execute in minecraft:the_end unless entity @e[type=minecraft:ender_dragon] run scoreboard players set #dragon_prev mh.dragon 0
