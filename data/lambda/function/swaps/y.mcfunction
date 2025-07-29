data modify storage lambda:lambda temp set value [0, x, [0, [9], x]]
#x
data modify storage lambda:lambda temp[1] set from storage lambda:lambda current[2]
data modify storage lambda:lambda temp[2][2] set from storage lambda:lambda current[2]

data modify storage lambda:lambda current set from storage lambda:lambda temp

return 1