#Input: num1, num2. Result: num6
scoreboard players set num6 lambda 0

# Bit 0
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 2
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 1.. if score num4 lambda matches 1.. run scoreboard players add num6 lambda 1
# Bit 1
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 4
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 2.. if score num4 lambda matches 2.. run scoreboard players add num6 lambda 2
# Bit 2
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 8
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 4.. if score num4 lambda matches 4.. run scoreboard players add num6 lambda 4
# Bit 3
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 16
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 8.. if score num4 lambda matches 8.. run scoreboard players add num6 lambda 8
# Bit 4
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 32
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 16.. if score num4 lambda matches 16.. run scoreboard players add num6 lambda 16
# Bit 5
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 64
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 32.. if score num4 lambda matches 32.. run scoreboard players add num6 lambda 32
# Bit 6
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 128
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 64.. if score num4 lambda matches 64.. run scoreboard players add num6 lambda 64
# Bit 7
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 256
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 128.. if score num4 lambda matches 128.. run scoreboard players add num6 lambda 128
# Bit 8
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 512
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 256.. if score num4 lambda matches 256.. run scoreboard players add num6 lambda 256
# Bit 9
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 1024
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 512.. if score num4 lambda matches 512.. run scoreboard players add num6 lambda 512
# Bit 10
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 2048
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 1024.. if score num4 lambda matches 1024.. run scoreboard players add num6 lambda 1024
# Bit 11
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 4096
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 2048.. if score num4 lambda matches 2048.. run scoreboard players add num6 lambda 2048
# Bit 12
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 8192
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 4096.. if score num4 lambda matches 4096.. run scoreboard players add num6 lambda 4096
# Bit 13
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 16384
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 8192.. if score num4 lambda matches 8192.. run scoreboard players add num6 lambda 8192
# Bit 14
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 32768
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 16384.. if score num4 lambda matches 16384.. run scoreboard players add num6 lambda 16384
# Bit 15
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 65536
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 32768.. if score num4 lambda matches 32768.. run scoreboard players add num6 lambda 32768
# Bit 16
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 131072
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 65536.. if score num4 lambda matches 65536.. run scoreboard players add num6 lambda 65536
# Bit 17
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 262144
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 131072.. if score num4 lambda matches 131072.. run scoreboard players add num6 lambda 131072
# Bit 18
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 524288
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 262144.. if score num4 lambda matches 262144.. run scoreboard players add num6 lambda 262144
# Bit 19
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 1048576
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 524288.. if score num4 lambda matches 524288.. run scoreboard players add num6 lambda 524288
# Bit 20
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 2097152
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 1048576.. if score num4 lambda matches 1048576.. run scoreboard players add num6 lambda 1048576
# Bit 21
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 4194304
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 2097152.. if score num4 lambda matches 2097152.. run scoreboard players add num6 lambda 2097152
# Bit 22
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 8388608
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 4194304.. if score num4 lambda matches 4194304.. run scoreboard players add num6 lambda 4194304
# Bit 23
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 16777216
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 8388608.. if score num4 lambda matches 8388608.. run scoreboard players add num6 lambda 8388608
# Bit 24
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 33554432
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 16777216.. if score num4 lambda matches 16777216.. run scoreboard players add num6 lambda 16777216
# Bit 25
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 67108864
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 33554432.. if score num4 lambda matches 33554432.. run scoreboard players add num6 lambda 33554432
# Bit 26
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 134217728
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 67108864.. if score num4 lambda matches 67108864.. run scoreboard players add num6 lambda 67108864
# Bit 27
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 268435456
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 134217728.. if score num4 lambda matches 134217728.. run scoreboard players add num6 lambda 134217728
# Bit 28
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 536870912
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 268435456.. if score num4 lambda matches 268435456.. run scoreboard players add num6 lambda 268435456
# Bit 29
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda 1073741824
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 536870912.. if score num4 lambda matches 536870912.. run scoreboard players add num6 lambda 536870912
# Bit 30
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
scoreboard players set num5 lambda -2147483648
scoreboard players operation num3 lambda %= num5 lambda
scoreboard players operation num4 lambda %= num5 lambda
execute if score num3 lambda matches 1073741824.. if score num4 lambda matches 1073741824.. run scoreboard players add num6 lambda 1073741824
# Bit 31
scoreboard players operation num3 lambda = num1 lambda
scoreboard players operation num4 lambda = num2 lambda
execute if score num3 lambda matches ..-1 if score num4 lambda matches ..-1 run scoreboard players remove num6 lambda 1