module Example where

fastfib :: Int -> Int -> Int -> Int
fastfib a b 0 = a
fastfib a b n = fastfib b (a + b) (n - 1)

main = fastfib 0 1 15
