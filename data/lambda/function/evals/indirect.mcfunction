data modify storage lambda:lambda args set value {}
data modify storage lambda:lambda args.index set from storage lambda:lambda current[1]
function lambda:evals/indirect_inner with storage lambda:lambda args
function lambda:eval