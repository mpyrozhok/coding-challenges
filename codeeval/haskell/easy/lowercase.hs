module Main
    where

import Data.Char (toLower)

main = do
    content <- getContents
    mapM_ putStrLn $ map (map toLower) $ lines content
