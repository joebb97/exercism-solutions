module Anagram (anagramsFor) where
import Data.Map (fromListWith, Map)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\candStr -> anagramOf xs candStr) xss

anagramOf :: String -> String -> Bool
anagramOf left right
    | asLowerLeft == asLowerRight = False
    | otherwise = buildCharCounts asLowerLeft == buildCharCounts asLowerRight
    where asLowerLeft = map toLower left
          asLowerRight = map toLower right

-- Comment so I can submit again
buildCharCounts :: String -> Map Char Integer
buildCharCounts = fromListWith (+) . map (\c -> (c, 1))
