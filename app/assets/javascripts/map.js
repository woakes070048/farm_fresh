
function initMap() {
  mapHandler = Gmaps.build('Google');
  mapHandler.buildMap({
      provider: {
        disableDefaultUI: false
      },
      internal: {
        id: 'map'
      }
    },
    function(){
      getMarkers();
    }
  );
}

function getMarkers() {
  $.getJSON("/map", function(data) {
    console.log(data);
    markers = mapHandler.addMarkers(data);
    mapHandler.bounds.extendWith(markers);
    mapHandler.fitMapToBounds();
    mapHandler.getMap().setZoom(9);
  });
}