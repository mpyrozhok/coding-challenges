module Main
    where

import Data.List.Split(splitOn)


main = do
    content <- getContents
    let pairs = map (splitOn ",") . lines $ content
    mapM_ (putStrLn . (\[x, y] -> filterPair x y)) pairs
    where
        filterPair f = filter (`notElem` tail f)
