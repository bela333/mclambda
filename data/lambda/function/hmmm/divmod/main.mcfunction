# SPDX-License-Identifier: MIT
# Author: hanmindev

#> bitwise:32/unsigned/divmod/main
#   Return the unsigned quotient and modulo of num1 and num2
##
# @params
#   num1, num2
#       Two 32-bit integers
# @returns
#   num3, num4
#       Two 32-bit integers, quotient and modulo
##
# num3 = div
# num4 = mod
##

scoreboard players operation num3 lambda = num1 lambda
execute if score num2 lambda matches 1.. run function lambda:hmmm/divmod/b0
execute if score num2 lambda matches ..0 run function lambda:hmmm/divmod/b1