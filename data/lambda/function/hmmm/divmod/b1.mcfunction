# SPDX-License-Identifier: MIT
# Author: hanmindev

#> bitwise:32/unsigned/divmod/b1
#   branch from bitwise:32/unsigned/divmod/main
##
# io.R0 = div
# io.R1 = mod
##

scoreboard players set num3 lambda 0
execute if score num2 lambda <= num3 lambda if score num2 lambda matches ..-1 run scoreboard players set num3 lambda 1

scoreboard players operation num4 lambda = num1 lambda
execute if score num3 lambda matches 0 run scoreboard players operation num3 lambda -= num2 lambda