module Main
    where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import Data.Bits (shiftL,(.&.))

bitPositionsAreSame :: Int-> Int-> Int-> Bool
bitPositionsAreSame x p1 p2 = 
    let 
        state1 = x .&. mask p1 
        state2 = x .&. mask p2
    in
        (state1 > 0 && state2 > 0) || (state1 == 0 && state2 == 0)
    where 
        mask x = shiftL 1 (x - 1)

main = do
    content <- getContents
    let numbers =  map (map (read :: String -> Int)) $ map (splitOn ",") . lines $ content
    mapM_ putStrLn [r | x:p1:p2:[] <- numbers, let r = if bitPositionsAreSame x p1 p2 then "true" else "false"]
