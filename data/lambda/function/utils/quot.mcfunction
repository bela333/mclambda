#Input: num1, num2. Result: num1
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num1 lambda /= num2 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1
scoreboard players operation num4 lambda = num1 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1, num4 is num1
scoreboard players operation num4 lambda *= num2 lambda
# num1 is first arg `div` second arg, num2 is second arg, num3 is original num1, num4 is num1*2
# if result is negative and multiplying back gets different result, should round up
execute unless score num3 lambda = num4 lambda if score num1 lambda matches ..-1 run scoreboard players add num1 lambda 1