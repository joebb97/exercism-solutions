module Anagram
  ( anagramsFor
  ) where

import Data.Char (toLower)
import Data.Map (Map, fromListWith)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\candStr -> anagramOf xs candStr) xss

anagramOf :: String -> String -> Bool
anagramOf left right
  | asLowerLeft == asLowerRight = False
  | otherwise = buildCharCounts asLowerLeft == buildCharCounts asLowerRight
  where
    asLowerLeft = map toLower left
    asLowerRight = map toLower right

buildCharCounts :: String -> Map Char Integer
buildCharCounts = fromListWith (+) . map (\c -> (c, 1))
