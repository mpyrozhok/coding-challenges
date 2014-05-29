triangle :: Int -> [[Int]]
triangle 1 = [[1]]
triangle n = triangle' [] 1 [[1]]
    where     
        triangle' :: [Int] -> Int -> [[Int]] -> [[Int]]
        triangle' prev i lns
            | i == n = reverse lns
            | otherwise = let line = 1:elements prev [] ++ [1] in triangle' line (i + 1) (line:lns)
            where                
                elements [] _ = []
                elements [x, x'] sm = x + x':sm
                elements (x:x':xs) sm = elements (x':xs) (x + x':sm)
                
main = getContents >>= return . unlines . map (unwords . map show) . triangle . read >>= putStr
