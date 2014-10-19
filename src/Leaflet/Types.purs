module Leaflet.Types where

import Control.Monad.Eff

type URL = String

foreign import data ILayer :: *
foreign import data Icon :: *
foreign import data LatLng :: *
foreign import data LatLngBounds :: *
foreign import data LayerGroup :: *
foreign import data Map :: *
foreign import data Marker :: *
foreign import data Popup :: *
foreign import data TileLayer :: *

class Layer a where
  toILayer :: a -> ILayer
  addTo :: forall e. a -> Map -> Eff e a

type MapOptions = { attributionControl :: Boolean,
                    center :: LatLng,
                    layers :: [ILayer],
                    maxBounds :: LatLngBounds,
                    zoom :: Number }

type TileLayerOptions r = { subdomains :: [String] | r }

type MarkerOptions = { icon :: Icon }

type PopupOptions = {}
