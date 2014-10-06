module Main
    where

data GrowPhase = Double | Increment

-- |
-- >>> growTree 0
-- 1
-- >>> growTree 1
-- 2
-- >>> growTree 2
-- 3
-- >>> growTree 3
-- 6
-- >>> growTree 4
-- 7
growTree :: Int -> Int
growTree x = growTree' 1 Double x
    where
        growTree' :: Int -> GrowPhase -> Int -> Int
        growTree' acc _ 0 = acc
        growTree' acc Double i = growTree' (acc * 2) Increment (pred i)
        growTree' acc Increment i = growTree' (acc + 1) Double (pred i)

main = getContents >>= mapM_ print . (\(_:xs) -> map (growTree . read) xs) . lines
