# [44, "bind", lhs, rhs]
data modify storage lambda:lambda stack prepend from storage lambda:lambda current[3]
data modify storage lambda:lambda current set from storage lambda:lambda current[2]
execute unless function lambda:ioexec run return fail
data modify storage lambda:lambda temp set value [0, [], []]
data modify storage lambda:lambda temp[1] set from storage lambda:lambda stack[0]
data modify storage lambda:lambda temp[2] set from storage lambda:lambda current
data modify storage lambda:lambda current set from storage lambda:lambda temp
data remove storage lambda:lambda stack[0]
execute unless function lambda:ioexec run return fail
return 1