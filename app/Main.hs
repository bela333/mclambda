{-# OPTIONS_GHC -Wno-unused-do-bind #-}

module Main where

import Data.List (intercalate)
import Data.Map (Map, empty, insert, toList, union)
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

createTree :: [Token] -> [Tree] -> Tree
createTree ((CombOp comb) : ts) stack = createTree ts (Lit comb : stack)
createTree ((RefOp num) : ts) (tree : stack) = createTree ts (Reference num tree : stack)
createTree ((IndOp num) : ts) stack = createTree ts (Indirect num : stack)
createTree (ApOp : ts) (tree1 : tree2 : stack) = createTree ts (Ap tree2 tree1 : stack)
createTree (RetOp : _) (tree : _) = tree
createTree ops start = error $ "createTree error: " ++ show (ops, start)

findIndirect :: Tree -> Map Int Tree
findIndirect (Ap t1 t2) = findIndirect t1 `union` findIndirect t2
findIndirect (Lit _) = empty
findIndirect (Indirect _) = empty
findIndirect (Reference num t) = insert num t $ findIndirect t

minecraftify :: Tree -> String
minecraftify (Ap t1 t2) = "[0," ++ minecraftify t1 ++ "," ++ minecraftify t2 ++ "]"
minecraftify (Indirect num) = "[22, " ++ show num ++ "]"
minecraftify (Reference num _) = "[22, " ++ show num ++ "]"
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
  let Right (_, parsed) = parseRes
  let tree = createTree parsed []
  let indirections = findIndirect tree
  let result = minecraftify tree
  let hackForNat = "[0,[0," ++ result ++ ",[5]],[4,0]]"
  let shared = intercalate "," $ map (\(num, indirectTree) -> show num ++ ":" ++ minecraftify indirectTree) (toList indirections)
  putStrLn $ "data modify storage lambda:lambda current set value " ++ hackForNat
  putStrLn $ "data modify storage lambda:lambda sharing set value {" ++ shared ++ "}"
  return ()
