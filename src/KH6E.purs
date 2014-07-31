module KH6E where

import           Control.Monad.Eff
import           Data.Array
import           Leaflet.Icon
import           Leaflet.LatLng
import           Leaflet.LatLngBounds
import           Leaflet.LayerGroup
import           Leaflet.Map
import           Leaflet.Marker
import qualified Leaflet.Plugin.AwesomeMarkers as Awesome
import           Leaflet.Popup
import           Leaflet.TileLayer
import           Leaflet.Types

streetMap = do
  tile <- tileLayer "http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.jpg"
          $ { subdomains: [ "otile1", "otile2", "otile3", "otile4" ] }
  return $ toILayer tile

topoMap = do
  tile <- tileLayer "http://{s}.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"
          $ { subdomains: [] }
  return $ toILayer tile

karcRepeaters = do
  greenTransferIcon <- Awesome.icon { prefix: "glyphicon"
                                    , icon: "transfer"
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
  return $ toILayer $ layerGroup $ map toILayer [ kahili, wilcox, waimea, crater ]

karcMeetingPlaces = do
  blueInstitutionIcon <- Awesome.icon { prefix: "fa"
                                      , icon: "institution"
                                      , markerColor: "blue" }
  blueFlashIcon <- Awesome.icon { prefix: "glyphicon"
                                , icon: "flash"
                                , markerColor: "blue" }
  blueCutleryIcon <- Awesome.icon { prefix: "glyphicon"
                                  , icon: "cutlery"
                                  , markerColor: "blue" }
  civic <- bindPopup "Kauai Civic Center" {}
           $ marker { icon: blueInstitutionIcon }
           $ latLng 21.975914 (-159.368900)
  kiuc  <- bindPopup "Kauai Islang Utility Coop" {}
           $ marker { icon: blueFlashIcon }
           $ latLng 21.970248 (-159.384513)
  fpig  <- bindPopup "The Feral Pig" {}
           $ marker { icon: blueCutleryIcon }
           $ latLng 21.961465 (-159.353008)
  return $ toILayer $ layerGroup $ map toILayer [ civic, kiuc, fpig ]

foreign import windowWidth
  "function windowWidth() { return $(window).width(); }"
  :: forall e. Eff e Number

zoomByWidth n = if n > 768 then 11 else 10

kauaiMap :: forall e. Eff e Map
kauaiMap = do
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
                    zoom: zoomByWidth width }
