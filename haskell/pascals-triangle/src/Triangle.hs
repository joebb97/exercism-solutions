module Triangle
  ( rows
  ) where

-- ITERATIVE SOLUTION
rows :: Int -> [[Integer]]
rows 0 = []
rows x = reverse intermed
  where
    intermed = foldl (flip nextRow) [] [1 .. x]

nextRow :: Int -> [[Integer]] -> [[Integer]]
nextRow 1 listSoFar = [1] : listSoFar
nextRow _ listSoFar = newHead : listSoFar
  where
    lastRow:_ = listSoFar
    (pairs, _, _) = foldl (flip getPairs) ([], 0, 0) lastRow
    sums = map (\(a, b) -> a + b) pairs
    newHead = 1 : sums

type Accum = ([(Integer, Integer)], Integer, Integer)

getPairs :: Integer -> Accum -> Accum
getPairs item info = (newList, col + 1, item)
  where
    (pairsSoFar, col, prevItem) = info
    newList = (prevItem, item) : pairsSoFar
-- RECURSIVE SOLUTION
-- rows :: Int -> [[Integer]]
-- rows 0 = []
-- rows x = map pascal [1..x]
-- pascal :: Int -> [Integer]
-- pascal 1 = [1]
-- pascal n = zipWith (+) ([0] ++ pascal (n-1)) (pascal (n-1) ++ [0])
