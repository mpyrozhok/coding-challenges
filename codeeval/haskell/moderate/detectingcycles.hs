module Main
    where

import Data.Maybe (catMaybes)

-- | 
-- >>> getCycle ""
-- Nothing
-- >>> getCycle "a"
-- Nothing
-- >>> getCycle "ab"
-- Nothing
-- >>> getCycle "kabab"
-- Just "ab"
-- >>> getCycle "vassrssr"
-- Just "ssr"
-- >>> getCycle [2, 0, 6, 3, 1, 6, 3, 1, 6, 3, 1]
-- Just [6,3,1]
-- >>> getCycle [2, 0, 5, 11, 12, 9, 4, 3, 6, 8, 10, 1, 7, 13, 41, 56, 59, 41, 56, 59, 41, 56, 59, 41, 56, 59]
-- Just [41,56,59]
getCycle :: Eq a => [a] -> Maybe [a]
getCycle [] = Nothing
getCycle [x] = Nothing
getCycle xs = cycleLength (drop 1 xs) (drop 2 xs) >>= getCycle
    where
        getCycle l = Just cyclicPart
            where
                cyclicPart = map (fst) . take l $ dropWhile (\(a,b) -> a /= b) $ zip xs (drop l xs)

        cycleLength _ [] = Nothing
        cycleLength (t:ts) (h:hs) = if t == h then cycle else cycleLength ts (drop 1 hs)
            where
                cycle = Just $ length ts - length hs

main = do
    content <- getContents
    mapM_ putStrLn $ map (unwords) . catMaybes . map getCycle $ numbers content
    
    where
        numbers = map words . lines
