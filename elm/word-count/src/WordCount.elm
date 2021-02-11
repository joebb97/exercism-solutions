module WordCount exposing (wordCount)

import Dict exposing (Dict)


pruneWord : String -> String
pruneWord input =
    let
        noRight =
            if String.endsWith "'" input then
                String.dropRight 1 input

            else
                input

        noLeft =
            if String.startsWith "'" noRight then
                String.dropLeft 1 noRight

            else
                noRight
    in
    String.toLower noLeft


wordCount : String -> Dict String Int
wordCount sentence =
    let
        words =
            String.words <|
                String.map
                    (\c ->
                        if Char.isAlphaNum c || c == '\'' then
                            c

                        else
                            ' '
                    )
                    sentence

        updateDict word dictSoFar =
            Dict.update (pruneWord word) (\v -> Just <| Maybe.withDefault 0 v + 1) dictSoFar
    in
    List.foldl updateDict Dict.empty words
