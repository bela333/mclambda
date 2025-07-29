scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
#tellraw @a {"text": "I should be doing a swap for: ", extra:[{score:{objective:"lambda",name:"tag"}}]}
function lambda:display_state {text:"doing swap"}

execute if function lambda:swap_case run function lambda:eval
return 0