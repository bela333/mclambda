{-# OPTIONS_GHC -Wno-unused-do-bind #-}

module Main where

import Data.List (intercalate)
import Data.Map (Map, empty, insert, toList, union)
import System.Environment (getArgs)
import Text.Parsec hiding (tokens)
import Text.Parsec.String (Parser, parseFromFile)

-- Indirect/IndOp: Reference to shared tree
-- Reference/RefOp: Creates new shared tree
data AST = Ap AST AST | Comb String | Indirect Int | Reference Int AST | Number Int deriving (Show)
data Token = CombOp String | RefOp Int | IndOp Int | ApOp | RetOp | NumOp Int deriving (Show)

type IndirectCount = Int

parseInd :: Parser Token
parseInd = do
  string "_"
  ref :: Int <- read <$> many digit
  return $ IndOp ref

parseRef :: Parser Token
parseRef = do
  string ":"
  ref :: Int <- read <$> many digit
  return $ RefOp ref

parseAp :: Parser Token
parseAp = do
  string "@"
  return ApOp

parseRet :: Parser Token
parseRet = do
  string "}"
  return RetOp

parseNum :: Parser Token
parseNum = do
  string "#"
  num :: Int <- read <$> many digit
  return $ NumOp num

parseComb :: Parser Token
parseComb = do
  combName <- manyTill anyToken (endOfLine <|> space)
  return $ CombOp combName

parseToken :: Parser Token
parseToken = do
  res <- parseInd <|> parseRef <|> parseAp <|> parseRet <|> parseNum <|> parseComb
  spaces
  return res

parseTop :: Parser (IndirectCount, [Token])
parseTop = do
  string' "v8.2"
  endOfLine
  indirectCount :: IndirectCount <- read <$> many alphaNum
  endOfLine
  tokens <- many1 parseToken
  return (indirectCount, tokens)

-- Convert parsed content to AST from RPN.
createAST :: [Token] -> [AST] -> AST
createAST ((CombOp comb) : ts) stack = createAST ts (Comb comb : stack)
createAST ((IndOp num) : ts) stack = createAST ts (Indirect num : stack)
createAST (NumOp num : ts) stack = createAST ts (Number num : stack)
createAST ((RefOp num) : ts) (tree : stack) = createAST ts (Reference num tree : stack)
createAST (ApOp : ts) (tree1 : tree2 : stack) = createAST ts (Ap tree2 tree1 : stack)
createAST (RetOp : _) (tree : _) = tree
createAST ops start = error $ "createAST error: " ++ show (ops, start)

-- Find all shared reference creations in AST
findReference :: AST -> Map Int AST
findReference (Ap t1 t2) = findReference t1 `union` findReference t2
findReference (Reference num t) = insert num t $ findReference t
findReference _ = empty

-- Turn AST into SNBT used by datapack
minecraftify :: AST -> String
minecraftify (Ap t1 t2) = "[0," ++ minecraftify t1 ++ "," ++ minecraftify t2 ++ "]"
minecraftify (Indirect num) = "[22, " ++ show num ++ "]"
minecraftify (Reference num _) = "[22, " ++ show num ++ "]"
minecraftify (Comb "S") = "[1]"
minecraftify (Comb "K") = "[2]"
minecraftify (Comb "I") = "[3]"
minecraftify (Number num) = "[4, " ++ show num ++ "]"
minecraftify (Comb "zero") = "[4, 0]"
minecraftify (Comb "succ") = "[5]"
minecraftify (Comb "S'") = "[6]"
minecraftify (Comb "A") = "[7]"
minecraftify (Comb "U") = "[8]"
minecraftify (Comb "Y") = "[9]"
minecraftify (Comb "B") = "[10]"
minecraftify (Comb "B'") = "[11]"
minecraftify (Comb "Z") = "[12]"
minecraftify (Comb "C") = "[13]"
minecraftify (Comb "C'") = "[14]"
minecraftify (Comb "P") = "[15]"
minecraftify (Comb "R") = "[16]"
minecraftify (Comb "O") = "[17]"
minecraftify (Comb "K2") = "[18]"
minecraftify (Comb "K3") = "[19]"
minecraftify (Comb "K4") = "[20]"
minecraftify (Comb "C'B") = "[21]"
minecraftify (Comb "+") = "[24]"
minecraftify (Comb "*") = "[25]"
-- minecraftify (Comb l) = error $ "Unknown literal: \"" ++ l ++ "\""
minecraftify (Comb l) = "[23, " ++ show l ++ "]"

main :: IO ()
main = do
  (filename : _) <- getArgs
  parseRes <- parseFromFile parseTop filename
  let Right (_, parsed) = parseRes
  let ast = createAST parsed []
  let astsnbt = minecraftify ast
  -- Map of shared trees
  let shared = findReference ast
  -- SNBT object containing all shared trees along with their indices
  let sharingsnbt = intercalate "," $ map (\(num, indirectTree) -> show num ++ ":" ++ minecraftify indirectTree) (toList shared)
  putStrLn $ "data modify storage lambda:lambda current set value " ++ astsnbt
  putStrLn $ "data modify storage lambda:lambda sharing set value {" ++ sharingsnbt ++ "}"
  return ()
