module Leaflet.Popup where

import Leaflet.Types

foreign import popupToILayer
  "function popupToILayer(l) {\
  \  return l;\
  \}" :: Popup -> ILayer

instance popupLayer :: Layer Popup where
  toILayer = popupToILayer
