# Modernized Manhunt - Tick Function
# Called every game tick (20 times per second)

# Place team selectors in the hotbar of undecided players and apply effects
execute as @a run execute unless entity @s[tag=joined_team] run tag @s add undecided
effect give @a[tag=undecided] hunger 1 255 true
effect give @a[tag=undecided] regeneration 1 255 true
item replace entity @a[tag=undecided] hotbar.2 with blaze_rod[attribute_modifiers=[{id:"block_interaction_range",type:"block_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}},{id:"entity_interaction_range",type:"entity_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}}],food={nutrition:20,saturation:5,can_always_eat:true},consumable={consume_seconds:0.01,animation:"none",sound:"block.amethyst_block.place",has_consume_particles:false,on_consume_effects:[{type:"minecraft:remove_effects",effects:["minecraft:regeneration","minecraft:hunger"]}]},custom_name={"bold":true,"color":"red","italic":false,"shadow_color":11546150,"text":"Runner"}] 1
item replace entity @a[tag=undecided] hotbar.6 with breeze_rod[attribute_modifiers=[{id:"block_interaction_range",type:"block_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}},{id:"entity_interaction_range",type:"entity_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}}],food={nutrition:20,saturation:5,can_always_eat:true},consumable={consume_seconds:0.01,animation:"none",sound:"block.amethyst_block.place",has_consume_particles:false,on_consume_effects:[{type:"minecraft:remove_effects",effects:["minecraft:regeneration","minecraft:hunger"]}]},custom_name={"bold":true,"color":"blue","italic":false,"shadow_color":11546150,"text":"Hunter"}] 1
item replace entity @a[tag=undecided] hotbar.4 with filled_map[attribute_modifiers=[{id:"block_interaction_range",type:"block_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}},{id:"entity_interaction_range",type:"entity_interaction_range",amount:-1,operation:"add_multiplied_total",slot:"any",display:{type:"hidden"}}],custom_name={"bold":true,"color":"aqua","italic":false,"shadow_color":11546150,"text":"Select on of the options by right clicking"}] 1

# Run countdown logic if in countdown state (state=1)
execute if score #game mh.state matches 1 run function manhunt:game/countdown_tick

# Check for runner death if game is active (state=2)
execute if score #game mh.state matches 2 run function manhunt:game/check_runner

# Check for dragon death if game is active (state=2)
execute if score #game mh.state matches 2 run function manhunt:game/check_dragon
