module Example where

import Control.Monad
import Data.Functor.Const
import Data.Functor.Identity

newtype State a b = State {runState :: a -> (a, b)}

instance Monad (State a) where
  return x = State $ \s -> (s, x)
  m >>= n = State $ \s -> let (s', v) = runState m s in runState (n v) s'

instance Applicative (State a) where
  pure = return
  (<*>) = ap

instance Functor (State a) where
  fmap = liftM

get :: State a a
get = State $ \s -> (s, s)

modify :: (a -> a) -> State a ()
modify f = State $ \s -> (f s, ())

evalState :: State a b -> a -> b
evalState m = snd . runState m

type Number = Int
data FibState = FibState {_prevNum :: Number, _currentNum :: Number}

type Lens a b = forall f. (Functor f) => (b -> f b) -> a -> f a

prevNum :: Lens FibState Number
prevNum f (FibState p c) = fmap (\p' -> FibState p' c) $ f p

currentNum :: Lens FibState Number
currentNum f (FibState p c) = fmap (\c' -> FibState p c') $ f c

modifier :: Lens a b -> (b -> b) -> a -> a
modifier l s a = runIdentity $ l (\b -> Identity $ s b) a

setter :: a -> Lens a b -> b -> a
setter a l b = modifier l (const b) a

getter :: a -> Lens a b -> b
getter a l = getConst $ l Const a

zoom :: Lens st st' -> State st' a -> State st a
zoom l s = State $ \state -> let (s', v) = runState s (getter state l) in (setter state l s', v)

fibState :: Int -> State FibState Int
fibState n = do
  forM_ [1 .. n] $ \_ -> do
    modify $ \(FibState p c) -> (FibState c (c + p))
  s <- get
  zoom prevNum get

main :: Int
main = evalState (fibState 7) (FibState 0 1)
