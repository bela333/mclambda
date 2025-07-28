module Example where

data Nat = Succ Nat | Zero

one = Succ Zero
two = Succ one
three = Succ two
four = Succ three
five = Succ four
six = Succ five
seven = Succ six
eight = Succ seven
nine = Succ eight
ten = Succ nine

add :: Nat -> Nat -> Nat
add Zero b = b
add (Succ a) b = Succ $ add a b

mul :: Nat -> Nat -> Nat
mul Zero b = Zero
mul (Succ a) b = (a `mul` b) `add` b

-- Takes a Nat, a succ function and a zero value and returns the accumulated value
mcNatify :: Nat -> (a -> a) -> a -> a
mcNatify Zero s z = z
mcNatify (Succ prev) s z = s $ mcNatify prev s z

fac :: Nat -> Nat
fac Zero = one
fac (Succ n) = (fac n) `mul` (Succ n)

main = mcNatify $ fac four
