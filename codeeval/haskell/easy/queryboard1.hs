module Main
    where

import Data.List (replicate, mapAccumL)

applyQuery :: [[Int]] -> String -> ([[Int]], [Int])
applyQuery board query = 
    case command of
    "SetCol" -> (setColumn board i x, [])
    "SetRow" -> (setRow board i x, [])
    "QueryCol" -> (board, [queryCol board])
    "QueryRow" -> (board, [queryRow board])
    where 
        (command:params) = words query
        [i, x] = map read params
        [j] = map read params
        queryCol = sum . map (!! j)
        queryRow = sum . (!! j)

setColumn :: [[Int]] -> Int -> Int -> [[Int]]
setColumn board i x = [[if fst e == i then x else snd e | e <- zip [0..] row] | row <- board]

setRow :: [[Int]] -> Int -> Int -> [[Int]]
setRow board j x = [if fst r == j then newLine else snd r | r <- zip [0..] board]
    where newLine = replicate 256 x

main = do
    content <- getContents
    let board = replicate dim $ replicate dim 0
    let commands = lines $ content
    mapM_ print $ concat . snd $ mapAccumL applyQuery board commands
    where
        dim = 256
