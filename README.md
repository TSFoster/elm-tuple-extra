# elm-tuple-extra

Convenience functions for working with tuples.

## `Tuple2`

* `pairTo`, `double` and `swap` for creating and arranging tuples
* `uncurry` and `apply` for using functions with values in a tuple
* `maybeMapFirst` and `maybeMapSecond` for lifting a `Maybe` out of a tuple

## `Tuple3`

* Copies and extensions of all `Tuple` functions to work with 3-tuples (`first`, `second`, `third`, `mapFirst`, `mapSecond`, `mapThird`, `mapAllThree`)
* Functions for creating 3-tuples (`join`, `joinTo`, `triple`, `splitFirst`, `splitSecond`)
* Functions for rearranging values in 3-tuples (`reverse`, `rotateLeft`, `rotateRight`, `swapFirst`, `swapLast`)
* `uncurry` and `apply` for using functions with values in a 3-tuple
* `maybeMapFirst`, `maybeMapSecond` and `maybeMapThird` for lifting a `Maybe` out of a 3-tuple
