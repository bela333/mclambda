data modify storage lambda:lambda stack prepend from storage lambda:lambda current
data modify storage lambda:lambda current set from storage lambda:lambda current[1]
function lambda:eval
function lambda:display_state {text:"eval returned"}
# assume top of stack is the same element as we have started with
data modify storage lambda:lambda stack[0][1] set from storage lambda:lambda current
data modify storage lambda:lambda current set from storage lambda:lambda stack[0]
data remove storage lambda:lambda stack[0]
function lambda:display_state {text:"stack restored"}
execute if score rewinding lambda matches 1 run scoreboard players remove rewindsteps lambda 1
execute if score rewinding lambda matches 1 if score rewindsteps lambda matches 0 run function lambda:swap