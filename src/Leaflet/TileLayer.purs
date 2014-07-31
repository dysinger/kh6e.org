module Leaflet.TileLayer where

import Control.Monad.Eff
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
  \    return function() {\
  \      return L.tileLayer(u,o);\
  \    }\
  \  }\
  \}"
  :: forall e. URL -> TileLayerOptions -> Eff e TileLayer
