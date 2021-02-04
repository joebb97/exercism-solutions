module Triangle exposing (rows)


getPairs : Int -> ( List ( Int, Int ), Int, Int ) -> ( List ( Int, Int ), Int, Int )
getPairs item info =
    let
        ( pairsSoFar, col, prevItem ) =
            info

        newList =
            ( prevItem, item ) :: pairsSoFar
    in
    ( newList, col + 1, item )


nextRow : Int -> List (List Int) -> List (List Int)
nextRow n listSoFar =
    if n == 1 then
        [ 1 ] :: listSoFar

    else
        let
            lastRow =
                Maybe.withDefault [] <| List.head listSoFar

            (pairs, _, _) =
                    List.foldl
                        getPairs
                        ( [], 0, 0 )
                        lastRow

            sums = 
                List.map (\tup -> Tuple.first tup + Tuple.second tup) pairs

            newHead =
                1 :: sums 
        in
        newHead :: listSoFar


rows : Int -> List (List Int)
rows n =
    if n == 0 then
        []

    else
        List.reverse <| List.foldl nextRow [] <| List.range 1 n
