module Main
    where

import Data.Char (digitToInt)

main = do
    content <- getContents
    let numbers = map (\x -> sum $ map digitToInt x) $ lines content
    mapM_ print numbers
