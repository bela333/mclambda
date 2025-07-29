# save second argument for later. Stack: [second argument]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[2]
# evaluate first argument
data modify storage lambda:lambda current set from storage lambda:lambda current[1][2]
function lambda:eval
# save result for later. Stack: [first result, second argument]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current
# evaluate second argument
data modify storage lambda:lambda current set from storage lambda:lambda stack[1]
function lambda:eval

# Check types
execute store result score num1 lambda run data get storage lambda:lambda stack[0][0]
execute store result score num2 lambda run data get storage lambda:lambda current[0]
execute unless score num1 lambda matches 4 run tellraw @a "first argument of `gt` was not a number"
execute unless score num2 lambda matches 4 run tellraw @a "second argument of `gt` was not a number"
execute unless score num1 lambda matches 4 run return fail
execute unless score num2 lambda matches 4 run return fail

# Do calculation
execute store result score num1 lambda run data get storage lambda:lambda stack[0][1]
execute store result score num2 lambda run data get storage lambda:lambda current[1]
execute if score num1 lambda > num2 lambda run data modify storage lambda:lambda current set value [7]
execute unless score num1 lambda > num2 lambda run data modify storage lambda:lambda current set value [2]

# restore stack
data remove storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]

function lambda:eval