function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
execute store result score num1 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 44 run tellraw @a "executed statement was not IO"
execute unless score num1 lambda matches 44 run tellraw @a {nbt:"current",storage:"lambda:lambda"}
execute unless score num1 lambda matches 44 run return fail
data modify storage lambda:lambda args set value {}
data modify storage lambda:lambda args.effectname set from storage lambda:lambda current[1]
# Handle error handling on this, somehow
function lambda:iocase with storage lambda:lambda args
return 1