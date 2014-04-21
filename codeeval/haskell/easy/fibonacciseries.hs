module Main
    where

fibonacci :: Integer -> Integer -> [Integer]
fibonacci 0 1 = 0:1:1:fibonacci 1 1
fibonacci x2 x1 = let x = x2 + x1 in x:fibonacci x1 x

main = do
    content <- getContents
    let numbers =  map (read :: String -> Int) $ lines content
    print $ take 15 $ fibonacci 0 1
    mapM_ print [fibonacci 0 1 !! x | x <- numbers]
