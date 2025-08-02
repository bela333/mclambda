{-# OPTIONS_GHC -Wno-unused-do-bind #-}

module Main where

import Data.List (intercalate)
import Data.Map (Map, empty, insert, toList, union)
import GHC.IO.Handle.Types (Handle__ (Handle__))
import System.Environment (getArgs)
import Text.Parsec hiding (tokens)
import Text.Parsec.String (Parser, parseFromFile)

-- Indirect/IndOp: Reference to shared tree
-- Reference/RefOp: Creates new shared tree
data AST = Ap AST AST | Comb String | Indirect Int | Reference Int AST | Number Int | StringNode String deriving (Show)
data Token = CombTok String | RefTok Int | IndTok Int | ApTok | RetTok | NumTok Int | StringLitTok String deriving (Show)

type IndirectCount = Int

parseInd :: Parser Token
parseInd = do
  char '_'
  ref :: Int <- read <$> many digit
  return $ IndTok ref

parseRef :: Parser Token
parseRef = do
  char ':'
  ref :: Int <- read <$> many digit
  return $ RefTok ref

parseAp :: Parser Token
parseAp = do
  char '@'
  return ApTok

parseRet :: Parser Token
parseRet = do
  char '}'
  return RetTok

parseNum :: Parser Token
parseNum = do
  string "#"
  num :: Int <- read <$> many digit
  return $ NumTok num

parseComb :: Parser Token
parseComb = do
  combName <- manyTill anyToken (endOfLine <|> space)
  return $ CombTok combName

parseString :: Parser Token
parseString = do
  char '"'
  content <- many parseStringChar
  char '"'
  return $ StringLitTok content
 where
  parseStringChar :: Parser Char
  parseStringChar =
    ( do
        char '\\'
        anyToken
    )
      -- TODO: Decode \ and ^ correctly.
      <|> ( do
              char '|'
              anyToken
          )
      <|> ( do
              char '^'
              anyToken
          )
      <|> noneOf ['"']

parseToken :: Parser Token
parseToken = do
  res <- parseInd <|> parseRef <|> parseAp <|> parseRet <|> parseNum <|> parseString <|> parseComb
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
createAST (CombTok comb : ts) stack = createAST ts (Comb comb : stack)
createAST (IndTok num : ts) stack = createAST ts (Indirect num : stack)
createAST (NumTok num : ts) stack = createAST ts (Number num : stack)
createAST (RefTok num : ts) (tree : stack) = createAST ts (Reference num tree : stack)
createAST (StringLitTok str : ts) stack = createAST ts (StringNode str : stack)
createAST (ApTok : ts) (tree1 : tree2 : stack) = createAST ts (Ap tree2 tree1 : stack)
createAST (RetTok : _) (tree : _) = tree
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
minecraftify (Number num)
  | num > 2147483647 = "[4, " ++ show (num - 4294967296) ++ "]"
  | otherwise = "[4, " ++ show num ++ "]"
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
minecraftify (Comb "-") = "[26]"
minecraftify (Comb "==") = "[27]"
minecraftify (Comb "<=") = "[28]"
minecraftify (Comb "<") = "[29]"
minecraftify (Comb ">=") = "[30]"
minecraftify (Comb ">") = "[31]"
minecraftify (Comb "seq") = "[32]"
minecraftify (Comb "urem") = "[33]"
minecraftify (Comb "shr") = "[34]"
minecraftify (Comb "inv") = "[35]"
minecraftify (Comb "ashr") = "[36]"
minecraftify (Comb "shl") = "[37]"
minecraftify (Comb "and") = "[38]"
minecraftify (Comb "quot") = "[39]"
minecraftify (Comb "rem") = "[40]"
minecraftify (Comb "uquot") = "[41]"
minecraftify (Comb "ucmp") = "[42]"
-- minecraftify (Comb l) = error $ "Unknown literal: \"" ++ l ++ "\""
minecraftify (Comb l) = "[23, " ++ show l ++ "]"
minecraftify (StringNode str) = "[23, " ++ show ("Tried decoding string: " ++ str) ++ "]"

filePrefix :: String
filePrefix =
  "scoreboard players set rewinding lambda 0\n"
    ++ "scoreboard players set rewindsteps lambda 0\n"
    ++ "data remove storage lambda:lambda stack"

fileSuffix :: String
fileSuffix =
  "tellraw @a \"Running...\"\n"
    ++ "function lambda:instrumented_eval"

main :: IO ()
main = do
  args <- getArgs
  let (inputPath : _) = args
  parseRes <- parseFromFile parseTop inputPath
  case parseRes of
    Left err -> print err
    Right (_, parsed) -> do
      let ast = createAST parsed []
      let astsnbt = minecraftify ast
      -- Map of shared trees
      let shared = findReference ast
      -- SNBT object containing all shared trees along with their indices
      let sharingsnbt = intercalate "," $ map (\(num, indirectTree) -> show num ++ ":" ++ minecraftify indirectTree) (toList shared)
      let currentcmb = "data modify storage lambda:lambda current set value " ++ astsnbt
      let sharingcmb = "data modify storage lambda:lambda sharing set value {" ++ sharingsnbt ++ "}"
      case args of
        (_ : outputPath : _) -> writeFile outputPath (filePrefix ++ "\n" ++ currentcmb ++ "\n" ++ sharingcmb ++ "\n" ++ fileSuffix)
        _ -> do
          putStrLn currentcmb
          putStrLn sharingcmb
