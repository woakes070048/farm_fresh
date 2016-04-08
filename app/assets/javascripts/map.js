
function initMap() {
  var mapHandler = Gmaps.build('Google');
  mapHandler.buildMap({
      provider: {
        disableDefaultUI: false
      },
      internal: {
        id: 'map'
      },
      zoom: 12

    },
    function(){
      markers = mapHandler.addMarkers([
        {
          "lat": 52,
          "lng": -2.2,
          "picture": {
            "url": "https://s3-eu-west-1.amazonaws.com/kpfarmfresh/pin.png",
            "width":  32,
            "height": 37
          },
          "infowindow": "hello!"
        }
      ]);
      mapHandler.bounds.extendWith(markers);
      mapHandler.fitMapToBounds();
      mapHandler.getMap().setZoom(11);
    }
  );

  return mapHandler;
}