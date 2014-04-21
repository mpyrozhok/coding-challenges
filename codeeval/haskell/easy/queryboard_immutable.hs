module Main
    where

import Data.Array.Unboxed

data Command = SetCol Int Int
            | SetRow Int Int
            | QueryCol Int
            | QueryRow Int deriving (Show, Read)

applyQuery :: [Command] -> Array (Int, Int) Int -> [Int]
applyQuery [] board = []
applyQuery (command:xs) board = 
    case command of
        SetCol x a -> applyQuery xs (board // [((x, y), a) | y <- [0..dim]])
        SetRow y a -> applyQuery xs (board // [((x, y), a) | x <- [0..dim]])
        QueryCol i -> queryCol i: applyQuery xs board
        QueryRow i -> queryRow i: applyQuery xs board
    where 
        dim = 255
        queryCol x = sum [board ! (x, y) | y <- [0..dim]]
        queryRow y = sum [board ! (x, y) | x <- [0..dim]]


main = do
    content <- getContents
    let board = array ((0,0), (dim, dim)) [((i, j), 0) | i <- [0..dim], j <- [0..dim]]
    let commands = map (read :: String -> Command) . lines $ content
    mapM_ print $ applyQuery commands board
    where
        dim = 255
