module Main
    where
import Data.List.Split (splitOn)
import Data.List (inits, tails)

main = do
    content <- getContents
    let numbers = map (map read . splitOn (",")) . lines $ content
    mapM_ print $ map (splice) $ numbers
    where
--        sequences = map sum . filter (not $ null) . concat . tails . inits
--        sequences = map maximum . map (map sum . filter (not . null) . inits) . filter (not . null) .tails
        sequences l [] = l
        sequences l (x:xs) = sequences (max l (subs xs)) xs
            where
                subs ns = maximum [sum $ take n ns | n <- [1..length ns]]
        splice (x:xs) = sequences x xs
--        numbers = map (map read . splitOn (","))
