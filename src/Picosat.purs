module Picosat (
  picosat_sat,
  Solution(..)
  ) where

foreign import ffi_picosat_sat :: Array (Array Int) -> Array Int -> { satisfiable :: Boolean, solution :: Array Int }

data Solution = Solution (Array Int)
              | Unsatisfiable

convert_ffi :: {satisfiable :: Boolean, solution :: Array Int} -> Solution
convert_ffi {satisfiable: false, solution: _} = Unsatisfiable
convert_ffi {satisfiable: true, solution: x} = Solution x

picosat_sat :: Array (Array Int) -> Array Int -> Solution
picosat_sat formula assumptions = convert_ffi (ffi_picosat_sat formula assumptions)
