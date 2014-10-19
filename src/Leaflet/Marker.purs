module Leaflet.Marker where

import Control.Monad.Eff
import Leaflet.Types

foreign import markerToILayer
  """
  function markerToILayer(l) {
    return l;
  }
  """ :: Marker -> ILayer

foreign import addMarkerToMap
  """
  function addMarkerToMap(l) {
    return function(m) {
      return function() {
        return l.addTo(m);
      }
    }
  }
  """
  :: forall e. Marker -> Map -> Eff e Marker

instance markerLayer :: Layer Marker where
  toILayer = markerToILayer
  addTo = addMarkerToMap

foreign import marker
  """
  function marker(o) {
    return function(l) {
      return L.marker(l,o);
    }
  }
  """
  :: MarkerOptions -> LatLng -> Marker

foreign import bindPopup
  """
  function bindPopup(s) {
    return function(o) {
      return function(m) {
        return function() {
          return m.bindPopup(s,o);
        }
      }
    }
  }
  """
  :: forall e. String -> PopupOptions -> Marker -> Eff e Marker
