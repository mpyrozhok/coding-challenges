module Main
    where

combinations1 k xs = combinations' (length xs) k xs
  where combinations' n k' l@(y:ys)
          | k' == 0   = [[]]
          | k' >= n   = [l]
          | null l    = []
          | otherwise = map (y :) (combinations' (n - 1) (k' - 1) ys) ++ combinations' (n - 1) k' ys

-- |
-- >>> combinations 2 "abc"
-- ["ca","ba","cb"]
combinations :: Int -> String -> [String]
combinations k xs = combinations' [] xs
    where
        l = k - 1
        combinations' :: [String] -> String -> [String]
        combinations' cs [] = cs
        combinations' cs xs' = combinations' (cs ++ rowCombinations) (drop 1 xs')
            where
                rowCombinations :: [String]
                rowCombinations = let pfx = take l xs' in foldl (\x y -> (y:(pfx)):x) [] (drop l xs')

main = undefined
