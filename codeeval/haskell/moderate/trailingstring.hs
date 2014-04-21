module Main
    where

import Data.List.Split (splitOn)

-- | 
-- >>> hasTrailingString ["Hello World","World"]
-- "1"
-- >>> hasTrailingString ["San Francisco","San Jose"]
-- "0"
-- >>> hasTrailingString ["an Jose","San Jose"]
-- "0"
hasTrailingString :: [String] -> String
hasTrailingString xs = if containerIsLongEnough && containerHasTrailingString then "1" else "0"
    where
        containerIsLongEnough = (length container) >= (length str)
        containerHasTrailingString = all (\(x, y) -> x == y) $ zip (reverse container) (reverse str)
        [container, str] = xs

main = do
    getContents >>= putStr . unlines . process . lines
    where
        process = map (hasTrailingString . splitOn ",")
