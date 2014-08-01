module Leaflet.Types where

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

type MapOptions = { attributionControl :: Boolean,
                    center :: LatLng,
                    layers :: [ILayer],
                    maxBounds :: LatLngBounds,
                    zoom :: Number }

type TileLayerOptions = { subdomains :: [String] }

type MarkerOptions = { icon :: Icon }

type PopupOptions = {}