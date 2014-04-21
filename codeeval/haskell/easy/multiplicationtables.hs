module Main
    where

padLeft :: String -> Int -> String
padLeft x places = (take (places - length x) $ repeat ' ') ++ x

multTable x y = [[n * m | n <- [1..x]]| m <- [1..y]]

main = do
    mapM_ putStrLn [concat line | line <- map (map (\x -> padLeft (show x) 4)) $ multTable 12 12]
