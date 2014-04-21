module Main
    where

import Data.Array.IO
import Control.Monad (liftM)

data Command = SetCol Int Int
            | SetRow Int Int
            | QueryCol Int
            | QueryRow Int deriving (Show, Read)

applyQuery :: [Command] -> IO (IOUArray (Int, Int) Int) -> IO [Int]
applyQuery (command:xs) board = do
    case command of
        SetCol x a -> do
            mapM_ (\y -> writeArray board (x, y) a) [0..dim]
            applyQuery xs board
        SetRow y a -> do 
            mapM_ (\x -> writeArray board (x, y) a) [0..dim]
            applyQuery xs board
        QueryCol i -> queryCol i: applyQuery xs board
        QueryRow i -> queryRow i: applyQuery xs board
    where 
        dim = 255
        queryCol x = do 
            s <- mapM (\y -> readArray board (x, y)) [0..dim]
            liftM sum s
        queryRow y = do 
            s <- fmap sum (\x -> readArray board (x, y)) [0..dim]
            liftM sum s 

main = do
    content <- getContents
    board <- newArray ((0,0), (dim, dim)) 0 -- :: IO (IOUArray (Int, Int) Int)
    let commands = map (read :: String -> Command) . lines $ content
    mapM_ print $ applyQuery commands board
    where
        dim = 255
