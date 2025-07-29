#Create argument object for macro call
data modify storage lambda:lambda args set value {}
data modify storage lambda:lambda args.index set from storage lambda:lambda current[1]
#Dereference
function lambda:evals/indirect_load with storage lambda:lambda args
#Store args for later
data modify storage lambda:lambda stack prepend from storage lambda:lambda args
#Evaluate dereferenced tree
function lambda:eval
#Save evaluated tree
data modify storage lambda:lambda args set from storage lambda:lambda stack[0]
function lambda:evals/indirect_save with storage lambda:lambda args
#Restore stack
data remove storage lambda:lambda stack[0]