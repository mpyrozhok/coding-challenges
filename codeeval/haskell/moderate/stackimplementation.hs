module Main
    where

data Stack = Stack [Int]

push :: Int -> Stack -> Stack
push x (Stack xs) = Stack (x:xs)

pop :: Stack -> (Int, Stack)
pop (Stack (x:xs)) = (x, Stack xs) 

main = getContents >>= putStr . unlines . map (unwords . map show . popAlternate . pushAll . map read . words) . lines
    where
        pushAll = foldr push (Stack [])

        popAll :: Stack -> [Int] -> [Int]
        popAll (Stack []) res = res
        popAll xs res = let (n, ns) = pop xs in popAll ns (n:res)

        popAlternate xs = [x | (x, y) <- zip (popAll xs []) [1..], odd y]
