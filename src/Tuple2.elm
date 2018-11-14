module Tuple2 exposing
    ( pairTo, double
    , swap
    , uncurry, apply
    , maybeMapFirst, maybeMapSecond
    )

{-| Convenience functions for working with 2-tuples.


## Creating tuples

@docs pairTo, double


## Swapping values

@docs swap


## Applying functions

@docs uncurry, apply


## Tuples and Maybes

@docs maybeMapFirst, maybeMapSecond

-}


{-| Swap the values in a 2-tuple.

    swap ( '1', "1" ) --> ("1", '1')

-}
swap : ( a, b ) -> ( b, a )
swap ( a, b ) =
    ( b, a )


{-| Create a 2-tuple.

    { foo = [1, 2], bar = Nothing }
        |> pairTo Cmd.none
    --> ({ foo = [1, 2], bar = Nothing }, Cmd.none)

-}
pairTo : b -> a -> ( a, b )
pairTo b a =
    ( a, b )


{-| Create a 2-tuple.

    double 0 --> (0, 0)

-}
double : a -> ( a, a )
double a =
    ( a, a )


{-| Apply each value in a 2-tuple to a function that takes at least 2 arguments.

    uncurry List.repeat ( 3, 'a' ) --> ['a', 'a', 'a']

-}
uncurry : (a -> b -> c) -> ( a, b ) -> c
uncurry fn ( a, b ) =
    fn a b


{-| Apply the second value in a 2-tuple to the function in the first position.

apply (String.toLower, "HELLO") --> "hello"

-}
apply : ( a -> b, a ) -> b
apply ( fn, a ) =
    fn a


{-| Apply a function that produces a `Maybe` to the first value in a 2-tuple. If
it returns `Just something`, pair the something back with the second value in
the 2-tuple.

    ("1", "horse")
      |> maybeMapFirst String.toInt
    --> Just (1, "horse")

    ("One", "horse")
      |> maybeMapFirst String.toInt
    --> Nothing

-}
maybeMapFirst : (a -> Maybe a2) -> ( a, b ) -> Maybe ( a2, b )
maybeMapFirst fn ( a, b ) =
    Maybe.map (pairTo b) (fn a)


{-| Apply a function that produces a `Maybe` to the second value in a 2-tuple.
If it returns `Just something`, pair the something back with the first value in
the 2-tuple.

    ("King", ["Kong", "Kunta", "Henry VIII"])
      |> maybeMapSecond List.head
    --> Just ("King", "Kong")

-}
maybeMapSecond : (b -> Maybe b2) -> ( a, b ) -> Maybe ( a, b2 )
maybeMapSecond fn ( a, b ) =
    Maybe.map (Tuple.pair a) (fn b)
