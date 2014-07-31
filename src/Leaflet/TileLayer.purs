module Leaflet.TileLayer where

import Leaflet.Types

foreign import tileLayerToILayer
  "function tileLayerToILayer(l) {\
  \  return l;\
  \}" :: TileLayer -> ILayer

instance tileLayerLayer :: Layer TileLayer where
  toILayer = tileLayerToILayer

foreign import tileLayer
  "function tileLayer(u) {\
  \  return function(o) {\
  \    return L.tileLayer(u,o);\
  \  }\
  \}"
  :: URL -> TileLayerOptions -> TileLayer
