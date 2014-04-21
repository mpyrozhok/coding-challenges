module Main
    where

import Data.List.Split (splitOn)

-- |
-- >>> leftRight 2 3 [1,2,3,4,5,6]
-- [3,4,5]
-- >>> leftRight 2 3 [1,2,3,4]
-- [3,4]
leftRight s l xs = take l . drop s $ xs

-- |
-- >>> topDown 3
topDown s l xs = undefined
rightLeft s l xs = undefined
downUp s l xs = undefined
getSpiral :: (Int, Int, [Int]) -> [Int]
getSpiral (n, m, xs) = undefined

-- |
-- >>> getMatrix "3;3;1 2 3"
-- (3,3,[1,2,3])
getMatrix :: String -> (Int, Int, [Int])
getMatrix c = let [n, m, xs] = splitOn ";" c in
    (read n, read m, map read . words $ xs)

main = do
    c <- getContents
    mapM_ print $ getSpiral . getMatrix $ c
