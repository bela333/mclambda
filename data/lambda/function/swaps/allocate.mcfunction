data modify storage lambda:lambda args set value {}
execute store result storage lambda:lambda args.index int 1 run scoreboard players get allocationindex lambda
function lambda:swaps/allocate_inner with storage lambda:lambda args
data modify storage lambda:lambda current set value [22, 0]
execute store result storage lambda:lambda current[1] int 1 run scoreboard players get allocationindex lambda
scoreboard players add allocationindex lambda 1