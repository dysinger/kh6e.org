module KH6E where

foreign import windowWidth
  "function windowWidth() { return $(window).width(); }"
  :: Number

zoomByWidth :: Number -> Number
zoomByWidth w = if w > 768 then 11 else 10
