module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    let
        defaultCounts =
            { a = 0, t = 0, c = 0, g = 0 }

        handleChar char recSoFar =
            if Char.toUpper char == 'A' then
                {recSoFar | a = recSoFar.a + 1}
            else if char == 'T' then
                {recSoFar | t = recSoFar.t + 1}
            else if char == 'G' then
                {recSoFar | g = recSoFar.g + 1}
            else if char == 'C' then
                {recSoFar | c = recSoFar.c + 1}
            else
                recSoFar
                
    in
    List.foldl (handleChar) defaultCounts <| String.toList sequence
