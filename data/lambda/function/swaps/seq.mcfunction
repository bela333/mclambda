#Save second argument to stack
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[2]
#strictly evaluate first argument
data modify storage lambda:lambda current set from storage lambda:lambda current[1][2]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
data modify storage lambda:lambda current set from storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]
return 1