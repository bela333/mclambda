module Example where

import Control.Monad
import Data.Fixed

type X = Int
type Y = Int
type Z = Int

data Coord = Coord X Y Z

black :: Coord -> IO ()
black (Coord x y z) = (_primitive "IO.black") x y z

white :: Coord -> IO ()
white (Coord x y z) = (_primitive "IO.white") x y z

size = 5
half = (size - 1) `div` 2

-- plot :: (HasResolution a) => Fixed a -> Fixed a
-- plot x = if x == 0 then 0 else 1 / x
--
-- shouldColor :: Int -> Int -> Bool
-- shouldColor _x _y = plot x >= y
--  where
--   x :: Centi
--   x = fromIntegral $ _x - half
--   y = fromIntegral $ _y - half

plot :: Int -> Int
plot x = x ^ 2 - half

shouldColor :: Int -> Int -> Bool
shouldColor _x _y = plot x >= y
 where
  x = _x - half
  y = _y - half

main = do
  forM_ [0 .. (size - 1)] $ \z -> do
    forM_ [0 .. (size - 1)] $ \y -> do
      let coord = (Coord 17 (y - 60) (z + 5))
      if (shouldColor z y)
        then white coord
        else black coord
