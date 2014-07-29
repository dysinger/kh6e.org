var map;
$(function() {
  var width = $(window).width();
  var zoomByWidth = width > 768 ? 11 : 10
  var centerOfKauai = L.latLng( [22.032822,-159.535493] );
  var boundaryOfKauai =
    L.latLngBounds( [[21.838940,-159.867926], [22.263536,-159.214770]] ).pad(.5);
  // maps
  var mqOSM = L.tileLayer(
    'http://{s}.mqcdn.com/tiles/1.0.0/osm/{z}/{x}/{y}.jpg',
    { subdomains: ['otile1', 'otile2', 'otile3', 'otile4'] }
  );
  var outdoors = L.tileLayer(
    'http://{s}.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png'
  );
  var terrain = L.tileLayer(
    'http://toolserver.org/~cmarqu/hill/{z}/{x}/{y}.png'
  );
  // repeaters
  var repeaters = L.layerGroup([
    L.marker([ 21.973375, -159.495779 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'transfer',
        markerColor: 'green'
      })}).bindPopup('Mt. Kahili: 142.920 (-)'),
    L.marker([ 21.985710, -159.365105 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'transfer',
        markerColor: 'green'
      })}).bindPopup('Wilcox: 147.080 (+)'),
    L.marker([ 22.052902, -159.661602 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'transfer',
        markerColor: 'green'
      })}).bindPopup('Waimea Canyon: 147.100 (+)'),
    L.marker([ 22.221804, -159.400771 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'transfer',
        markerColor: 'green'
      })}).bindPopup('Crater Hill: 146.700 (-)')
  ]);
  // meetings
  var meetings = L.layerGroup([
    L.marker([ 21.975914,-159.368900 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'fa',
        icon: 'institution',
        markerColor: 'blue'
      })}).bindPopup('Kauai Civic Center'),
    L.marker([ 21.9702481,-159.3845129 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'flash',
        markerColor: 'blue'
      })}).bindPopup('KIUC'),
    L.marker([ 21.961465, -159.353008 ], {
      icon: L.AwesomeMarkers.icon({
        prefix: 'glyphicon',
        icon: 'cutlery',
        markerColor: 'blue'
      })}).bindPopup('The Feral Pig')
  ]);
  // map
  map = L.map('map', {
    attributionControl: false,
    center: centerOfKauai,
    layers: [ mqOSM, repeaters, meetings ],
    maxBounds: boundaryOfKauai,
    scrollWheelZoom: false,
    zoom: zoomByWidth
  });
  L.control.layers({
    "Street": mqOSM,
    "Topo": outdoors
  }, {
    "Repeaters": repeaters,
    "Meetings": meetings
  }).addTo(map);
  new L.Control.GeoSearch({
    provider: new L.GeoSearch.Provider.Esri(),
    zoomLevel: 10
  }).addTo(map);
});
