module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Random (RANDOM)
import Test.QuickCheck ((===), (/==))
import Test.Spec (describe, it)
import Test.Spec.QuickCheck (quickCheck)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

main :: Eff (RunnerEffects (random :: RANDOM)) Unit
main = run [consoleReporter] do
  describe "Math" do
    it "works" $
      quickCheck \n -> (n * 2 / 2) === n
    it "works again" $
      quickCheck \n -> ((n + 1) * 2) /== n
