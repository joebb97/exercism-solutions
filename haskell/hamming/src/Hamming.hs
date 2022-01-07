module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys  
    | length xs /= length ys = Nothing
    | otherwise = Just total
    where
    total = sum comparisons
    cmpc (c1, c2) = fromEnum (c1 /= c2)
    pairings = zip xs ys
    comparisons = map cmpc pairings

