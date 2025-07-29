data modify storage lambda:lambda temp set value [0, y, x]
#y
data modify storage lambda:lambda temp[1] set from storage lambda:lambda current[2]
#x
data modify storage lambda:lambda temp[2] set from storage lambda:lambda current[1][2]

data modify storage lambda:lambda current set from storage lambda:lambda temp

return 1