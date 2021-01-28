module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    let
        sum =
            List.foldl (+) 0 <| List.range 1 n
    in
    sum * sum


sumOfSquares : Int -> Int
sumOfSquares n =
    let
        squares =
            List.map (\num -> num * num) <| List.range 1 n

    in
    List.foldl (+) 0 <| squares


difference : Int -> Int
difference n =
    (squareOfSum n) - (sumOfSquares n)
