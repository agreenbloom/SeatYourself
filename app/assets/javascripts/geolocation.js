function geolocationSuccess(position) {
  var longitude = position.coords.longitude;
  var latitude = position.coords.latitude;

  $.ajax({
    url:"/restaurants",
    method: 'Get',
    data: {
      longitude: longitude,
      latitude: latitude
    },
    dataType: 'script'
  });
}

function geolocationError() {
  console.log("error");
}


$(document).on('ready page:load', function(){
  $('#current-location').click(function(ev){
    ev.preventDefault();

    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
    } else {
      alert("update browser");
    }
  });
});