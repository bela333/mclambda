{-# OPTIONS_GHC -Wno-unused-do-bind #-}

module Main where

import Data.Map (Map, empty, insert, union, (!))
import System.Environment (getArgs)
import Text.Parsec hiding (tokens)
import Text.Parsec.String (Parser, parseFromFile)

data Tree = Ap Tree Tree | Lit String | Indirect Int | Reference Int Tree deriving (Show)
data Token = CombOp String | RefOp Int | IndOp Int | ApOp | RetOp deriving (Show)

type IndirectCount = Int

parseInd :: Parser Token
parseInd = do
  string "_"
  ref :: Int <- read <$> many alphaNum
  return $ IndOp ref

parseRef :: Parser Token
parseRef = do
  string ":"
  ref :: Int <- read <$> many alphaNum
  return $ RefOp ref

parseAp :: Parser Token
parseAp = do
  string "@"
  return ApOp

parseRet :: Parser Token
parseRet = do
  string "}"
  return RetOp

parseComb :: Parser Token
parseComb = do
  combName <- manyTill anyToken (endOfLine <|> space)
  return $ CombOp combName

parseToken :: Parser Token
parseToken = do
  res <- parseInd <|> parseRef <|> parseAp <|> parseRet <|> parseComb
  spaces
  return res

parseTop :: Parser (IndirectCount, [Token])
parseTop = do
  string' "v8.2"
  endOfLine
  indirectCount :: Int <- read <$> many alphaNum
  endOfLine
  tokens <- many1 parseToken
  return (indirectCount, tokens)

-- data Token = CombOp String | RefOp Int | IndOp Int | ApOp | RetOp deriving (Show)
-- data Tree = Ap Tree Tree | Lit String | Indirect Int | Reference Int deriving (Show)

createTree :: [Token] -> [Tree] -> Tree
createTree ((CombOp comb) : ts) stack = createTree ts (Lit comb : stack)
createTree ((RefOp num) : ts) (tree : stack) = createTree ts (Reference num tree : stack)
createTree ((IndOp num) : ts) stack = createTree ts (Indirect num : stack)
createTree (ApOp : ts) (tree1 : tree2 : stack) = createTree ts (Ap tree2 tree1 : stack)
createTree (RetOp : ts) (tree : _) = tree
createTree ops start = error $ "createTree error: " ++ show (ops, start)

findIndirect :: Tree -> Map Int Tree
findIndirect (Ap t1 t2) = findIndirect t1 `union` findIndirect t2
findIndirect (Lit l) = empty
findIndirect (Indirect num) = empty
findIndirect (Reference num t) = insert num t $ findIndirect t

derefIndirect :: Tree -> Map Int Tree -> Tree
derefIndirect (Ap t1 t2) m = derefIndirect t1 m `Ap` derefIndirect t2 m
derefIndirect (Lit l) m = Lit l
derefIndirect (Indirect num) m = derefIndirect (m ! num) m
derefIndirect (Reference num t) m = derefIndirect t m

minecraftify :: Tree -> String
minecraftify (Ap t1 t2) = "[0," ++ minecraftify t1 ++ "," ++ minecraftify t2 ++ "]"
minecraftify (Indirect num) = error "Indirect used in minecraftify"
minecraftify (Reference num t) = error "Reference used in minecraftify"
minecraftify (Lit "S") = "[1]"
minecraftify (Lit "K") = "[2]"
minecraftify (Lit "I") = "[3]"
minecraftify (Lit "S'") = "[6]"
minecraftify (Lit "A") = "[7]"
minecraftify (Lit "U") = "[8]"
minecraftify (Lit "Y") = "[9]"
minecraftify (Lit "B") = "[10]"
minecraftify (Lit "B'") = "[11]"
minecraftify (Lit "Z") = "[12]"
minecraftify (Lit "C") = "[13]"
minecraftify (Lit "C'") = "[14]"
minecraftify (Lit "P") = "[15]"
minecraftify (Lit "R") = "[16]"
minecraftify (Lit "O") = "[17]"
minecraftify (Lit "K2") = "[18]"
minecraftify (Lit "K3") = "[19]"
minecraftify (Lit "K4") = "[20]"
minecraftify (Lit "C'B") = "[21]"
minecraftify (Lit l) = error "Unknown literal: " ++ l

main :: IO ()
main = do
  (filename : _) <- getArgs
  parseRes <- parseFromFile parseTop filename
  print parseRes
  let Right (_, parsed) = parseRes
  let tree = createTree parsed []
  let indirections = findIndirect tree
  let direct = derefIndirect tree indirections
  print tree
  print indirections
  print direct
  putStrLn $ minecraftify direct
