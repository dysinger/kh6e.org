module Leaflet.Control.Layers where

import Control.Monad.Eff
import Leaflet.Types

foreign import layersControlToILayer
  "function layersControlToILayer(l) {\
  \  return l;\
  \}" :: LayersControl -> ILayer

foreign import addLayersControlToMap
  "function addTo(l) {\
  \  return function(m) {\
  \    return function() {\
  \      return l.addTo(m);\
  \    }\
  \  }\
  \}"
  :: forall e. LayersControl -> Map -> Eff e LayersControl

instance layersControlLayer :: Layer LayersControl where
  toILayer = layersControlToILayer
  addTo = addLayersControlToMap

foreign import layersControl
  "function layersControl(o0) {\
  \  return function(o1) {\
  \    return L.control.layers(o0,o1);\
  \  }\
  \}"
  :: LayersControlOptions -> LayersControlOptions -> LayersControl

-- TODO Figure out the row poly so this works
