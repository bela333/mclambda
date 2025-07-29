module Example where

fac :: Int -> Int
fac 0 = 1
fac n = n * (fac $ n - 1)

main = if (3 :: Int) > 2 then 1 :: Int else 0 :: Int
