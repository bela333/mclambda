module Example where

import Primitives

-- Row major
data Matrix = Matrix Int Int Int Int

eye = Matrix 1 0 0 1

instance Num Matrix where
  (+) (Matrix a11 a12 a21 a22) (Matrix b11 b12 b21 b22) = Matrix (a11 + b11) (a12 + b12) (a21 + b21) (a22 + b22)
  (*) (Matrix a11 a12 a21 a22) (Matrix b11 b12 b21 b22) =
    Matrix
      (a11 * b11 + a12 * b21)
      (a11 * b12 + a12 * b22)
      (a21 * b11 + a22 * b21)
      (a21 * b12 + a22 * b22)
  negate (Matrix a11 a12 a21 a22) = Matrix (negate a11) (negate a12) (negate a21) (negate a22)
  abs = id
  signum = const eye
  fromInteger n = Matrix (fromIntegral n) 0 0 (fromIntegral n)

matrixfib :: Int -> Int
matrixfib n = r
 where
  (Matrix _ _ r _) = mx ^ n
  mx = Matrix 1 1 1 0

main :: Int
main = 3 ^ 2

-- main = 1 `primWordShl` 2
