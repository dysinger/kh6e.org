module Leaflet.LayerGroup where

import Leaflet.Types

foreign import layerGroupToILayer
  "function layerGroupToILayer(l) {\
  \  return l;\
  \}" :: LayerGroup -> ILayer

instance layerGroupLayer :: Layer LayerGroup where
  toILayer = layerGroupToILayer

foreign import layerGroup
  "function layerGroup(ls) {\
  \  return L.layerGroup(ls);\
  \}"
  :: [ILayer] -> LayerGroup
