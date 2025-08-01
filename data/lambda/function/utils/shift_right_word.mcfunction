# Shifts the value in num1 by num2
# as per Haskell documentation, num2 being negative is undefined behaviour
execute if score num2 lambda matches 1.. run scoreboard players operation num1 lambda /= TWO lambda
execute if score num2 lambda matches 1.. if score num1 lambda matches ..-1 run function lambda:utils/unextend
scoreboard players remove num2 lambda 1
execute if score num2 lambda matches 1.. run function lambda:utils/shift_right