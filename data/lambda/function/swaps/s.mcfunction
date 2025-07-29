data modify storage lambda:lambda temp set value [0, [0, [], []], [0, [], []]]
data modify storage lambda:lambda temp[1][1] set from storage lambda:lambda current[1][1][2]
data modify storage lambda:lambda temp[2][1] set from storage lambda:lambda current[1][2]

data modify storage lambda:lambda temp[1][2] set from storage lambda:lambda current[2]
data modify storage lambda:lambda temp[2][2] set from storage lambda:lambda current[2]

data modify storage lambda:lambda current set from storage lambda:lambda temp

return 1