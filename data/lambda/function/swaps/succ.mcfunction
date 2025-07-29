# load rhs expression
data modify storage lambda:lambda current set from storage lambda:lambda current[2]
# eval
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0

execute store result score temp lambda run data get storage lambda:lambda current[0]

# Probably not needed due to type correctness
execute unless score temp lambda matches 4 run return fail

execute store result score temp lambda run data get storage lambda:lambda current[1]
scoreboard players add temp lambda 1
execute store result storage lambda:lambda current[1] int 1 run scoreboard players get temp lambda

return 1