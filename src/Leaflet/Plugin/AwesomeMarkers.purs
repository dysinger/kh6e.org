module Leaflet.Plugin.AwesomeMarkers where

import Leaflet.Types

type IconOptions = { prefix :: String,
                     icon :: String,
                     markerColor :: String }

foreign import icon
  "function icon(o) {\
  \  return L.AwesomeMarkers.icon(o);\
  \}"
  :: IconOptions -> Icon
