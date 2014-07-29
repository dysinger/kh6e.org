module Main where

import KH6E

import Control.Monad.Eff
import Debug.Trace
import Test.QuickCheck

main = do

  trace "zoomByWidth should return 11 for width > 768 or default to 10"
  quickCheck $ \n -> zoomByWidth n == (if n > 768 then 11 else 10)
                     <?> "zoomByWidth failed on " ++ show n
