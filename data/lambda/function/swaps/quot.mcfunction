# save second argument for later. Stack: [second argument]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[2]
# evaluate first argument
data modify storage lambda:lambda current set from storage lambda:lambda current[1][2]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
# save result for later. Stack: [first result, second argument]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current
# evaluate second argument
data modify storage lambda:lambda current set from storage lambda:lambda stack[1]
function lambda:eval
scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0

# Check types
execute store result score num1 lambda run data get storage lambda:lambda stack[0][0]
execute store result score num2 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 4 run tellraw @a "first argument of `quot` was not a number"
execute unless score num2 lambda matches 4 run tellraw @a "second argument of `quot` was not a number"
execute unless score num1 lambda matches 4 run return fail
execute unless score num2 lambda matches 4 run return fail

# Do calculation
# num1 is first arg, num2 is second arg, num3 is original num1
execute store result score num1 lambda run data get storage lambda:lambda stack[0][1]
execute store result score num2 lambda run data get storage lambda:lambda current[1]
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num1 lambda /= num2 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1
scoreboard players operation num4 lambda = num1 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1, num4 is num1
scoreboard players operation num4 lambda *= num2 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1, num4 is num1*2
# if result is negative and multiplying back gets different result, should round up
execute unless score num3 lambda = num4 lambda if score num1 lambda matches ..-1 run scoreboard players add num1 lambda 1

# store result
data modify storage lambda:lambda current set value [4, 0]
execute store result storage lambda:lambda current[1] int 1 run scoreboard players get num1 lambda

# restore stack
data remove storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]
return 1