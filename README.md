# elm-tuple-extra

Convenience functions for working with tuples.

* Recreates all functions provided in `Tuple`, but for 3-tuples (e.g. `Tuple.first (1, 2) == Tuple.Extra.first (1, 2, 3) == 1`)
* Provides functions for re-ordering 2- and 3-tuples to any other order (`swap`, `reverse`, `rotateLeft`, `rotateRight`, `swapFirst`, `swapLast`)
* In addition to `Tuple.pair`, provides `pairTo`, `double` and `triple`
* Provides uncurrying functions for applying values in 2- and 3-tuples to a function (e.g. `uncurry2 List.repeat (2, 'a') == List repeat 2 'a'`)
