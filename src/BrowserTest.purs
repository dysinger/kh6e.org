module BrowserTest where

import Control.Monad.Eff
import Debug.Trace

foreign import popup
  "function popup(x) {\
  \  return function() {\
  \    alert(x);\
  \  }\
  \}"
  :: forall e. String -> Eff e Unit

msg = do
  trace "sending hello"
  popup "hello!"
  trace "hello sent"
