# SPDX-License-Identifier: MIT
# Author: hanmindev

#> bitwise:32/unsigned/divmod/b0
#   branch from bitwise:32/unsigned/divmod/main
##
# num3 = div
# num4 = mod
##

execute if score num3 lambda matches ..-1 run function lambda:hmmm/divmod/b00
scoreboard players operation num4 lambda = num3 lambda
scoreboard players operation num4 lambda %= num2 lambda
scoreboard players operation num3 lambda /= num2 lambda

execute if score num1 lambda matches ..-1 run function lambda:hmmm/divmod/b01