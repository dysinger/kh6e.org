module Leaflet.LatLng where

import Leaflet.Types

foreign import latLng
  "function latLng(n0) {\
  \  return function(n1) {\
  \    return L.latLng([n0,n1]);\
  \  }\
  \}"
  :: Number -> Number -> LatLng
