module Main
    where

import Data.List.Split (splitOn)

mod' :: Integral a => a -> a -> a
mod' x y = x - (floor $ fromIntegral x / fromIntegral y) * y

main = do
    content <- getContents
    let numbers = (map (map (read :: String -> Int) . splitOn ",") . lines) content
    mapM_ print $ map (\(x:y:[]) -> mod' x y) numbers
