# load.mcfunction
# This function is called every time you run /reload, and when the world first starts.

# NOTE:
# Always set your gamerules, difficulty, time, and worldspawn in the load function!
# These are NOT SAVED when worlds restart at the moment.
gamerule doMobSpawning false
gamerule mobGriefing false
gamerule doFireTick false
gamerule doImmediateRespawn true
gamerule locatorBar false
gamerule doDaylightCycle false
gamerule maxCommandChainLength 2147483647
time set 6000


scoreboard objectives remove lambda
scoreboard objectives add lambda dummy
scoreboard objectives setdisplay sidebar

data remove storage lambda:lambda current
data remove storage lambda:lambda stack
data remove storage lambda:lambda temp
data remove storage lambda:lambda execstack
data remove storage lambda:lambda args

scoreboard players set rewinding lambda 0
scoreboard players set rewindsteps lambda 0
scoreboard players set allocationindex lambda 0
scoreboard players set temp lambda 0
scoreboard players set num1 lambda 0
scoreboard players set num2 lambda 0
scoreboard players set num3 lambda 0
scoreboard players set num4 lambda 0
scoreboard players set num5 lambda 0
scoreboard players set num6 lambda 0
scoreboard players set TWO lambda 2

# ap : 0
# S : 1
# K : 2
# I : 3
# number: 4
# succ : 5
# S': 6
# A: 7
# U: 8
# Y: 9
# B: 10
# B': 11
# Z: 12
# C: 13
# C': 14
# P: 15
# R: 16
# O: 17
# K2: 18
# K3: 19
# K4: 20
# C'B: 21
# indirect: 22
# unimplemented: 23
# add: 24
# mul: 25
# sub: 26
# eq: 27
# le: 28
# lt: 29
# ge: 30
# gt: 31
# seq: 32
# urem: 33
# shr: 34
# inv: 35
# ashr: 36
# shl: 37
# and: 38
# quot: 39
# rem: 40
# uquot: 41
# ucmp: 42
# neg: 43
# io: 44

# To make sure your datapack is working, a load message can be useful.
tellraw @a { "color": "#00FF00", "text": "The Code is Load"}