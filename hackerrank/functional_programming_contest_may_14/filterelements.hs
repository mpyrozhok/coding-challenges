import qualified Data.IntMap as IM
import qualified Data.ByteString.Char8 as BS
import qualified Data.IntSet as IS
import Data.Maybe (fromJust)

-- |
-- >>> seenKTimes 2 [4, 5, 2, 5, 4, 3, 1, 3, 4] 
-- [4,5,3]
seenKTimes :: Int -> [Int] -> [Int]
seenKTimes k xs = if null ns then [(-1)] else ns
    where
        freqMap :: IM.IntMap Int
        freqMap = IM.fromListWith (+) $ zip xs (repeat 1)
        occuredKTimes :: Int -> Bool
        occuredKTimes n = let times = fromJust $ IM.lookup n freqMap in times >= k 
        ns = filter occuredKTimes $ reverse uniqNumbers 
        (uniqNumbers, _) = foldl (\(xs, s) x -> if IS.member x s then (xs, s) else (x:xs, IS.insert x s)) ([], IS.empty) xs

-- |
-- >>> processCases [[9,2],[4, 5, 2, 5, 4, 3, 1, 3, 4],[9, 4],[4, 5, 2, 5, 4, 3, 1, 3, 4]]
-- ["4 5 3","-1"]
processCases :: [[Int]] -> [String]
processCases cases = processCases' cases []
    where
        processCases' [] answers = reverse answers
        processCases' ([_,k]:ns:rest) answers = processCases' rest ((unwords . map show $ seenKTimes k ns):answers)

getInt = (\(Just (x, _)) -> x) . BS.readInt

main :: IO ()
main = BS.getContents >>= mapM_ putStrLn . (\(ncases:cases) -> processCases cases) . map (map getInt . BS.words) . BS.lines 
