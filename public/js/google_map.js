function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: {lat: -34.397, lng: 150.644}
  });

  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      var marker = new google.maps.Marker({
        position: pos,
        map: map,
        title: 'YOU!',
        draggable: true
      });

      var truck = new google.maps.Marker({
        position: {lat: 37.784778021272416, lng: -122.3962264976227},
        map: map,
        title: 'A Truck'
      });

      // truck.setMap(null);

      var radius = new google.maps.Circle({
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0,
        map: map,
        center: pos,
        radius: 800
      });

      map.setCenter(pos);

      google.maps.event.addListener(marker, 'dragend', function() {
        truck.setMap(null);

        var position = this.getPosition();
        var inRadius = [];
        var truckMarker = [];

        //need to do findInRadius
        //find location of a markers

        function findInRadius(truck){
          if (radius.getBounds().contains(truck.getPosition())){
            inRadius.push(truck);
          };
        };

        function showInRadius(){
          for(var i = 0; i < inRadius.length; i++){
            console.log(truckMarker[i])
            inRadius[i].setMap(map);
          }
        };

        radius.setMap(null);

        radius = new google.maps.Circle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: '#FF0000',
          fillOpacity: 0,
          map: map,
          center: position,
          radius: 800
        });

        map.setCenter(position);


        findInRadius(truck);
        // console.log(inRadius);
        showInRadius();
      });
    },

    function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });

  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  };
};

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}

