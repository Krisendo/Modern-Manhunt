# Modernized Manhunt - Tick Function
# Called every game tick (20 times per second)

# Run countdown logic if in countdown state (state=1)
execute if score #game mh.state matches 1 run function manhunt:game/countdown_tick

# Check for runner death if game is active (state=2)
execute if score #game mh.state matches 2 run function manhunt:game/check_runner

# Check for dragon death if game is active (state=2)
execute if score #game mh.state matches 2 run function manhunt:game/check_dragon
