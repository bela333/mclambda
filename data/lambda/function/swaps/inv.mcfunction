# evaluate argument
data modify storage lambda:lambda current set from storage lambda:lambda current[2]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0

# Check types
execute store result score num2 lambda run data get storage lambda:lambda current[0]
execute unless score num2 lambda matches 4 run tellraw @a "argument of `inv` was not a number"
execute unless score num2 lambda matches 4 run return fail

# Do calculation
scoreboard players set num1 lambda -1
execute store result score num2 lambda run data get storage lambda:lambda current[1]
scoreboard players operation num1 lambda -= num2 lambda

# store result
data modify storage lambda:lambda current set value [4, 0]
execute store result storage lambda:lambda current[1] int 1 run scoreboard players get num1 lambda

return 1