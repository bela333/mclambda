# SPDX-License-Identifier: MIT
# Author: hanmindev

#> bitwise:32/unsigned/divmod/b010
#   branch from bitwise:32/unsigned/divmod/b01
##
# io.R0 = div
# io.R1 = mod
# temp.0 = mod1
# temp.1 = div1
# temp.2 = or
##

scoreboard players operation 0 lambda -= num2 lambda
scoreboard players add num3 lambda 1