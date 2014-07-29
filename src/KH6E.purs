module KH6E where

-- import Data.Foreign.EasyFFI

-- windowWidth :: Number
-- windowWidth = unsafeForeignFunction [] "$(window).width()"

foreign import windowWidth
  "function windowWidth() { return $(window).width(); }"
  :: Number

zoomByWidth :: Number -> Number
zoomByWidth w = if w > 768 then 11 else 10

zoomByWindowWidth :: Number
zoomByWindowWidth = zoomByWidth windowWidth
