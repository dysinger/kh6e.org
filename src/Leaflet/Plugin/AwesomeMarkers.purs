module Leaflet.Plugin.AwesomeMarkers where

import Control.Monad.Eff
import Leaflet.Types

type IconOptions = { prefix :: String,
                     icon :: String,
                     markerColor :: String }

foreign import icon
  "function icon(o) {\
  \  return function() {\
  \    return L.AwesomeMarkers.icon(o);\
  \  }\
  \}"
  :: forall e. IconOptions -> Eff e Icon
