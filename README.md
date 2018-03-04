# purescript-picosat
WIP: picosat bindings in purescript. I use this project to learn about purescript.


## Example

```purescript
module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Picosat (picosat_sat, Solution(..))

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  case (picosat_sat [[-1, 2], [-2, 3]] [-1]) of
    Solution x -> log (show x)
    Unsatisfiable -> log "unsatisfiable"
```
