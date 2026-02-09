# Modernized Manhunt - Check Runner Death
# When game is active (state=2), detect Runner death via deathCount and trigger runner_died.

execute as @a[team=Runner,scores={mh.deaths=1..}] run function manhunt:game/runner_died
