module Main
    where

import Data.List (sortBy)

main = do
    content <- getContents
    let (lineCount:l) = lines content
    mapM_ putStrLn $ take (read lineCount :: Int) $ reverse $ sortBy (\x y -> compare (length x) (length y)) l
