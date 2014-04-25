commonPosition :: Int -> [Int] -> Int
commonPosition q b = foldl1 lcm b

--Input/Output.
main :: IO ()
main = getContents >>= print. (\[[q], b] -> commonPosition q b). map (map read. words). lines
