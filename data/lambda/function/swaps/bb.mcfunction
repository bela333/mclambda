data modify storage lambda:lambda temp set value [0, [0, x, y], [0, z, w]]
#w
data modify storage lambda:lambda temp[2][2] set from storage lambda:lambda current[2]
#z
data modify storage lambda:lambda temp[2][1] set from storage lambda:lambda current[1][2]
#y
data modify storage lambda:lambda temp[1][2] set from storage lambda:lambda current[1][1][2]
#x
data modify storage lambda:lambda temp[1][1] set from storage lambda:lambda current[1][1][1][2]

data modify storage lambda:lambda current set from storage lambda:lambda temp

return 1