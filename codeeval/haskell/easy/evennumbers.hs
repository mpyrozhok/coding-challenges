module Main
    where

main = do
    content <- getContents
    mapM_ print $ map (isEven . read::String->Int) . lines $ content
    where
        isEven x | even x = 1
                 | otherwise = 0
