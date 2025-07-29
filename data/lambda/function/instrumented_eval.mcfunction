#tellraw @a {text:"Before eval\n", extra:[{"storage":"lambda:lambda","nbt":"{}"}]}
function lambda:eval
#tellraw @a {text:"After eval\n", extra:[{"storage":"lambda:lambda","nbt":"{}"}]}
tellraw @a {text:"Result: ", extra:[{"storage":"lambda:lambda","nbt":"current"}]}