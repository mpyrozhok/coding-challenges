module Main
    where

import Data.List (sortBy)
import Data.Function (on)

main = do
    content <- getContents
    let (lineCount : l) = lines content
    mapM_ putStrLn $ take (read lineCount :: Int) $ sortBy (flip compare `on` length) l
