module Leaflet.LatLngBounds where

import Leaflet.Types

foreign import latLngBounds
  "function latLngBounds(l0) {\
  \  return function(l1) {\
  \    return L.latLngBounds([l0,l1]);\
  \  }\
  \}"
  :: LatLng -> LatLng -> LatLngBounds

foreign import pad
  "function pad(n) {\
  \  return function(l) {\
  \    return l.pad(n);\
  \  }\
  \}"
  :: Number -> LatLngBounds -> LatLngBounds
