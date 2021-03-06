{-
Copyright (C) 2014 Tim Dysinger

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-}

module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Leaflet.LatLng (latLng)
import Leaflet.LatLngBounds (latLngBounds, pad)
import Leaflet.Layer (toILayer)
import Leaflet.LayerGroup (layerGroup)
import Leaflet.Map (createMap)
import Leaflet.Marker (marker, bindPopup)
import Leaflet.Plugin.AwesomeMarkers as Awesome
import Leaflet.TileLayer (tileLayer)
import Leaflet.Types (Map, ILayer)

streetMap :: forall e. Eff e ILayer
streetMap = do
  toILayer <$> tileLayer "http://{s}.tile.osm.org/{z}/{x}/{y}.png"
    ({ attribution: "&copy; <a href='http://osm.org/copyright'>OpenStreetMap</a> contributors"
     , subdomains: ["a", "b", "c"] })

karcRepeaters :: forall e. Eff e ILayer
karcRepeaters = do
  greenTransferIcon <- Awesome.icon { prefix: "fa"
                                    , icon: "exchange"
                                    , markerColor: "green" }
  kahili <- bindPopup "Mt. Kahili: 146.920 (-)" {}
            $ marker { icon: greenTransferIcon }
            $ latLng 21.973375 (-159.495779)
  wilcox <- bindPopup "Wilcox: 147.080 (+)" {}
            $ marker { icon: greenTransferIcon }
            $ latLng 21.985710 (-159.365105)
  waimea <- bindPopup "Waimea Canyon: 147.100 (+)" {}
            $ marker { icon: greenTransferIcon }
            $ latLng 22.052902 (-159.661602)
  crater <- bindPopup "Crater Hill: 146.700 (-)" {}
            $ marker { icon: greenTransferIcon }
            $ latLng 22.221804 (-159.400771)
  pure $ toILayer $ layerGroup $ map toILayer [ kahili, wilcox, waimea, crater ]

karcMeetingPlaces :: forall e. Eff e ILayer
karcMeetingPlaces = do
  blueInstitutionIcon <- Awesome.icon { prefix: "fa"
                                      , icon: "institution"
                                      , markerColor: "blue" }
  blueFlashIcon <- Awesome.icon { prefix: "fa"
                                , icon: "flash"
                                , markerColor: "blue" }
  blueCutleryIcon <- Awesome.icon { prefix: "fa"
                                  , icon: "cutlery"
                                  , markerColor: "blue" }
  civic <- bindPopup "Lihue Civic Center<br>(Planning Room 2A/2B)" {}
           $ marker { icon: blueInstitutionIcon }
           $ latLng 21.975795 (-159.369375)
  kiuc  <- bindPopup "Kauai Island Utility Coop<br>Suite 1" {}
           $ marker { icon: blueFlashIcon }
           $ latLng 21.970248 (-159.384513)
  food  <- bindPopup "Kalapaki Joe's Kukui Grove" {}
           $ marker { icon: blueCutleryIcon }
           $ latLng 21.968975 (-159.378550)
  eoc   <- bindPopup "Kauai Civil Defense Agency \"EOC\"" {}
           $ marker { icon: blueInstitutionIcon }
           $ latLng 21.977250 (-159.355250)
  pure
    <<< toILayer
    <<< layerGroup
    <<< map toILayer
    $ [ civic, kiuc, food, eoc ]

foreign import windowWidth :: forall e. Eff e Number

main :: forall e. Eff e Map
main = do
  map <- streetMap
  repeaters <- karcRepeaters
  places <- karcMeetingPlaces
  let centerOfKauai = latLng 22.032822 (-159.535493)
      cornerKauaiSE = latLng 21.838940 (-159.867926)
      cornerKauaiNE = latLng 22.263536 (-159.214770)
  bounds <- pad 0.5 $ latLngBounds cornerKauaiSE cornerKauaiNE
  width <- windowWidth
  createMap "map" { attributionControl: false,
                    center: centerOfKauai,
                    layers: [ map, repeaters, places ],
                    maxBounds: bounds,
                    zoom: if width > 768.0 then 11 else 10 }
