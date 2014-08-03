module Leaflet.Popup where

import Control.Monad.Eff
import Leaflet.Types

foreign import popupToILayer
  "function popupToILayer(l) {\
  \  return l;\
  \}" :: Popup -> ILayer


foreign import addPopupToMap
  "function addTo(l) {\
  \  return function(m) {\
  \    return function() {\
  \      return l.addTo(m);\
  \    }\
  \  }\
  \}"
  :: forall e. Popup -> Map -> Eff e Popup

instance popupLayer :: Layer Popup where
  toILayer = popupToILayer
  addTo = addPopupToMap
