# SPDX-License-Identifier: MIT
# Author: hanmindev

#> bitwise:32/unsigned/divmod/b01
#   branch from bitwise:32/unsigned/divmod/b0
##
# io.R0 = div
# io.R1 = mod
# temp.0 = mod1
# temp.1 = div1
# temp.2 = or
##

scoreboard players set 0 lambda 1073741824
scoreboard players operation 0 lambda %= num2 lambda

scoreboard players set 1 lambda 1073741824
scoreboard players operation 1 lambda /= num2 lambda
scoreboard players operation 1 lambda *= TWO lambda
scoreboard players operation num3 lambda += 1 lambda

scoreboard players operation 0 lambda *= TWO lambda

scoreboard players set 2 lambda 0
execute if score 0 lambda matches ..-1 run scoreboard players set 2 lambda 1
execute if score 0 lambda >= num2 lambda run scoreboard players set 2 lambda 1
execute if score 2 lambda matches 1 run function lambda:hmmm/divmod/b010

scoreboard players operation num4 lambda += 0 lambda
scoreboard players set 2 lambda 0
execute if score num4 lambda matches ..-1 run scoreboard players set 2 lambda 1
execute if score num4 lambda >= num2 lambda run scoreboard players set 2 lambda 1
execute if score 2 lambda matches 1 run function lambda:hmmm/divmod/b011