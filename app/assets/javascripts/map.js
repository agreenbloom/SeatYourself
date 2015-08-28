function Map(mapId) {
  this.mapId = mapId;
}

Map.prototype.init = function (latitude, longitude) {
  var options = {
    center: {lat: latitude, lng: longitude},
    zoom: 15,
    mapTypeId: google.maps.mapTypeId.ROADMAP
  };

  this.canvas = new google.maps.Map(this.mapId, options)
}

Map.prototype.addMarker = function(latitude, longitude) {
  var options = {
    position: {lat: parseFloat(latitude), lng: parseFloat(longitude)},
    map: this.canvas
  }

  if (markerImage) {
    options.icon = markerImage;
  }

  var myMarker = new google.maps.Marker(options);
  this.markers.push(myMarker);
}

Map.prototype.removeMarker = function(marker){
  marker.setMap(null);

  var index = this.markers.indexOf(marker);
  this.markers.splice(index);
}


$document.on('ready page:load', function(){
  var mapCanvas - $('#map-canvas');
  var longitude = mapCanvas.data('longitude');
  var latitude = mapCanvas.data('latitude');
  var customIcon =  "http://maps.google.com/mapfiles/ms/icons/yellow-dot.org"
  //  nearby lats and longs

  if (mapCanvas.length) {
    window.myMap = new Map (mapCanvas[0]);
    myMap.init(latitude, longitude);
    myMap.addMarker(latitude, longitude);

    if (window.nearbys) {
      nearbys.forEach(function(coord) {
        myMap.addMarker(coord.lat, coord.lng, customIcon)
      });
    }
  }
});