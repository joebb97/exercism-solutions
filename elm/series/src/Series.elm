module Series exposing (slices)


helper elt tup =
    let
        ( itemsLeft, toTake, res ) =
            tup

        slice =
            List.take toTake itemsLeft

        newRes =
            if List.length itemsLeft >= toTake then
                List.append res [ slice ]

            else
                res
    in
    ( List.tail itemsLeft |> Maybe.withDefault [], toTake, newRes )


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if size == 0 then
        Err "slice length cannot be zero"

    else if size < 0 then
        Err "slice length cannot be negative"

    else if String.isEmpty input then
        Err "series cannot be empty"

    else if String.length input < size then
        Err "slice length cannot be greater than series length"

    else
        let
            asInts =
                String.toList input
                    |> List.map String.fromChar
                    |> List.map (\item -> String.toInt item |> Maybe.withDefault 0)

            ( _, _, res ) =
                List.foldl helper ( asInts, size, [] ) asInts
        in
        Ok res
