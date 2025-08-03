# [44, "black", x, y, z]
# TODO: handle stack rewind on error

data modify storage lambda:lambda stack prepend from storage lambda:lambda current[4]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[3]
# stack: y arg, z arg
data modify storage lambda:lambda current set from storage lambda:lambda current[2]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
execute store result score num1 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 4 run tellraw @a "black's x argument was not a number"
execute unless score num1 lambda matches 4 run return fail
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[1]
# stack: x res, y arg, z arg
data modify storage lambda:lambda current set from storage lambda:lambda stack[1]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
execute store result score num1 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 4 run tellraw @a "black's y argument was not a number"
execute unless score num1 lambda matches 4 run return fail
data modify storage lambda:lambda stack[1] set from storage lambda:lambda current[1]
# stack: x res, y res, z arg
data modify storage lambda:lambda current set from storage lambda:lambda stack[2]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
execute store result score num1 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 4 run tellraw @a "black's z argument was not a number"
execute unless score num1 lambda matches 4 run return fail
data modify storage lambda:lambda stack[2] set from storage lambda:lambda current[1]
# stack: x res, y res, z res
data modify storage lambda:lambda args set value {name:"minecraft:black_wool"}
data modify storage lambda:lambda args.x set from storage lambda:lambda stack[0]
data modify storage lambda:lambda args.y set from storage lambda:lambda stack[1]
data modify storage lambda:lambda args.z set from storage lambda:lambda stack[2]
function lambda:utils/setblock_macro with storage lambda:lambda args

# return ()
data modify storage lambda:lambda current set value [3]

data remove storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]

return 1