module Tuple3 exposing
    ( first, second, third, mapFirst, mapSecond, mapThird, mapAllThree
    , join, joinTo, triple, splitFirst, splitSecond
    , reverse, rotateLeft, rotateRight, swapFirst, swapLast
    , uncurry, apply
    , maybeMapFirst, maybeMapSecond, maybeMapThird
    )

{-| Convenience functions for working with tuples.


## `Tuple` functions for 3-tuples

@docs first, second, third, mapFirst, mapSecond, mapThird, mapAllThree


## Creating tuples

@docs join, joinTo, triple, splitFirst, splitSecond


## Swapping values

@docs reverse, rotateLeft, rotateRight, swapFirst, swapLast


## Applying functions

@docs uncurry, apply


## Tuples and Maybes

@docs maybeMapFirst, maybeMapSecond, maybeMapThird

-}


{-| Extract the first value from a 3-tuple.

    first ( 3, 4, 5 ) --> 3

    first ( "John", "H.", "Doe" ) --> "John"

-}
first : ( a, b, c ) -> a
first ( a, _, _ ) =
    a


{-| Extract the second value from a 3-tuple.

    second ( 3, 4, 5 ) --> 4

    second ( "John", "H.", "Doe" ) --> "H."

-}
second : ( a, b, c ) -> b
second ( _, b, _ ) =
    b


{-| Extract the third value from a 3-tuple.

    third ( 3, 4, 5 ) --> 5

    third ( "John", "H.", "Doe" ) --> "Doe"

-}
third : ( a, b, c ) -> c
third ( _, _, c ) =
    c


{-| Transform the first value in a 3-tuple.

    mapFirst String.reverse ( "stressed", 16, 1 ) --> ( "desserts", 16, 1 )

    mapFirst String.length ( "stressed", 16, 1 ) --> ( 8, 16, 1 )

-}
mapFirst : (a -> a2) -> ( a, b, c ) -> ( a2, b, c )
mapFirst fn ( a, b, c ) =
    ( fn a, b, c )


{-| Transform the second value in a 3-tuple.

    mapSecond sqrt ( "stressed", 16, 1 ) --> ( "stressed", 4, 1 )

    mapSecond negate ( "stressed", 16, 1 ) --> ( "stressed", -16, 1 )

-}
mapSecond : (b -> b2) -> ( a, b, c ) -> ( a, b2, c )
mapSecond fn ( a, b, c ) =
    ( a, fn b, c )


{-| Transform the second value in a 3-tuple.

    mapThird (List.repeat 2) ( "stressed", 16, 1 ) --> ( "stressed", 16, [1, 1] )

    mapThird String.fromInt ( "stressed", 16, 1 ) --> ( "stressed", 16, "1" )

-}
mapThird : (c -> c2) -> ( a, b, c ) -> ( a, b, c2 )
mapThird fn ( a, b, c ) =
    ( a, b, fn c )


{-| Create a 3-tuple with three values.

    join 1 2 3 --> ( 1, 2, 3 )

-}
join : a -> b -> c -> ( a, b, c )
join a b c =
    ( a, b, c )


{-| Create a 3-tuple with three values.

    1 |> joinTo 2 3
    --> ( 1, 2, 3 )

-}
joinTo : b -> c -> a -> ( a, b, c )
joinTo b c a =
    ( a, b, c )


{-| Create a 3-tuple with the same value.

    triple 0
    --> ( 0, 0, 0 )

-}
triple : a -> ( a, a, a )
triple a =
    ( a, a, a )


{-| Create a 3-tuple from a 2-tuple with a 2-tuple.

    splitFirst ( ( 1, 2 ), 3 ) --> ( 1, 2, 3 )

-}
splitFirst : ( ( a, b ), c ) -> ( a, b, c )
splitFirst ( ( a, b ), c ) =
    ( a, b, c )


{-| Create a 3-tuple from a 2-tuple with a 2-tuple.

    splitSecond ( 1, ( 2, 3 ) ) --> ( 1, 2, 3 )

-}
splitSecond : ( a, ( b, c ) ) -> ( a, b, c )
splitSecond ( a, ( b, c ) ) =
    ( a, b, c )


{-| Rotate values in 3-tuple to the right.

    rotateRight ( 1, 2, 3 ) --> ( 3, 1, 2 )

-}
rotateRight : ( a, b, c ) -> ( c, a, b )
rotateRight ( a, b, c ) =
    ( c, a, b )


{-| Rotate values in 3-tuple to the left.

    rotateLeft ( 1, 2, 3 ) --> ( 2, 3, 1 )

-}
rotateLeft : ( a, b, c ) -> ( b, c, a )
rotateLeft ( a, b, c ) =
    ( b, c, a )


{-| Reverse values in a 3-tuple.

    reverse ( 1, 2, 3 ) --> ( 3, 2, 1 )

-}
reverse : ( a, b, c ) -> ( c, b, a )
reverse ( a, b, c ) =
    ( c, b, a )


{-| Swap last two values in a 3-tuple.

    swapLast ( 1, 2, 3 ) --> ( 1, 3, 2 )

-}
swapLast : ( a, b, c ) -> ( a, c, b )
swapLast ( a, b, c ) =
    ( a, c, b )


{-| Swap first two values in a 3-tuple.

    swapFirst ( 1, 2, 3 ) --> ( 2, 1, 3 )

-}
swapFirst : ( a, b, c ) -> ( b, a, c )
swapFirst ( a, b, c ) =
    ( b, a, c )


{-| Transform all three parts of a 3-tuple.

    mapAllThree String.reverse sqrt List.length ( "stressed", 16, [] ) --> ( "desserts", 4, 0 )

    mapAllThree String.length negate List.isEmpty ( "stressed", 16, [] ) --> ( 8, -16, True )

-}
mapAllThree : (a -> d) -> (b -> e) -> (c -> f) -> ( a, b, c ) -> ( d, e, f )
mapAllThree aFn bFn cFn ( a, b, c ) =
    ( aFn a, bFn b, cFn c )


{-| Apply each value in a 3-tuple to a function that takes at least 3 arguments.

    type alias Person =
        { name : String
        , age : Int
        , hobbies : List String
        }

    uncurry Person ( "John Doe", 34, ["Hockey"] )
    --> { name = "John Doe", age = 34, hobbies = [ "Hockey" ] }

-}
uncurry : (a -> b -> c -> d) -> ( a, b, c ) -> d
uncurry fn ( a, b, c ) =
    fn a b c


{-| Apply the second and third values in a 3-tuple to the first.

    apply (String.cons, 'H', "ello")
    --> "Hello"

-}
apply : ( a -> b -> c, a, b ) -> c
apply ( fn, a, b ) =
    fn a b


{-| Apply a function that returns a `Maybe` to the first value in a 3-tuple. If
it returns `Just something`, join the second and third values back with it.

    ("1", "hit", "wonder")
      |> maybeMapFirst String.toInt
    --> Just (1, "hit", "wonder")

    ("One", "hit", "wonder")
      |> maybeMapFirst String.toInt
    --> Nothing

-}
maybeMapFirst : (a -> Maybe a2) -> ( a, b, c ) -> Maybe ( a2, b, c )
maybeMapFirst fn ( a, b, c ) =
    fn a |> Maybe.map (joinTo b c)


{-| Apply a function that returns a `Maybe` to the second value in a 3-tuple. If
it returns `Just something`, join the first and third values back with it.

    (1, "hit", "wonder")
      |> maybeMapSecond String.uncons
    --> Just (1, ('h', "it"), "wonder")

    (1, "hit", "wonder")
      |> maybeMapSecond String.toInt
    --> Nothing

-}
maybeMapSecond : (b -> Maybe b2) -> ( a, b, c ) -> Maybe ( a, b2, c )
maybeMapSecond fn ( a, b, c ) =
    fn b |> Maybe.map (\b2 -> ( a, b2, c ))


{-| Apply a function that returns a `Maybe` to the third value in a 3-tuple. If
it returns `Just something`, join the first and second values back with it.

    (1, "hit", "wonder")
      |> maybeMapThird String.uncons
    --> Just (1, "hit", ('w', "onder"))

    (1, "hit", "wonder")
      |> maybeMapThird String.toInt
    --> Nothing

-}
maybeMapThird : (c -> Maybe c2) -> ( a, b, c ) -> Maybe ( a, b, c2 )
maybeMapThird fn ( a, b, c ) =
    fn c |> Maybe.map (join a b)
