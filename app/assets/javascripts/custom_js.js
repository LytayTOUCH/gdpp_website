$(document).on('page:change', function() {
  $("#slideshow1").owlCarousel({
    autoPlay : 3000,
    navigation : false, // Show next and prev buttons
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem:true,
    stopOnHover : true,

    autoHeight : true
  });

  // if($('#map').length ){
  //   initMap(0.32453, 2.0234, 8, _element);
  // }

  if($('#gmap').length){
    var x = parseFloat($('#contact_latitude').val());
    var y = parseFloat($('#contact_longitude').val());
    var z = parseInt($('#contact_zoom_level').val());
    initialize(x,y,z);
  }
  
  if($('#admin-map').length){
    var x = parseFloat($('#admin-map-x').html());
    var y = parseFloat($('#admin-map-y').html());
    var z = parseInt($('#admin-map-z').html());
    initMap(x,y,z,'admin-map');
  }

  if($('#front-map').length){
    var x = parseFloat($('#front-map-x').html());
    var y = parseFloat($('#front-map-y').html());
    var z = parseInt($('#front-map-z').html());
    initMap(x,y,z,'front-map');
  }

})

// init mape for get
function initMap(_x, _y, _z, _element) {
  var myLatLng = {lat: _x, lng: _y};
  var map = new google.maps.Map(document.getElementById(_element), {
    zoom: _z,
    center: myLatLng
  });
  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Ministry of economy and finance'
  });
}
// init for form edit
function initialize(_x, _y, _z) {
    // Disable error log from google api
    console.log = console.error = console.info = console.debug = console.warn = console.trace = console.dir = console.dirxml = console.group = console.groupEnd = console.time = console.timeEnd = console.assert = console.profile = function() {};

    var myLatlng = new google.maps.LatLng(_x,_y);
    var myOptions = {
        zoom:_z,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("gmap"), myOptions);
    marker = new google.maps.Marker({
        position: myLatlng,
        map: map
    });
    google.maps.event.addListener(map, 'center_changed', function () {
        var location = map.getCenter();
        document.getElementById("contact_latitude").value = location.lat();
        document.getElementById("contact_longitude").value = location.lng();
        placeMarker(location);
    });
    google.maps.event.addListener(map, 'zoom_changed', function () {
        zoomLevel = map.getZoom();
        document.getElementById("contact_zoom_level").value = zoomLevel;
    });
    google.maps.event.addListener(marker, 'dblclick', function () {
        zoomLevel = map.getZoom() + 1;
        if (zoomLevel == 20) {
            zoomLevel = 10;
        }
        document.getElementById("zoom_level").innerHTML = zoomLevel;
        map.setZoom(zoomLevel);
    });
    function placeMarker(location) {
        var clickedLocation = new google.maps.LatLng(location);
        marker.setPosition(location);
    }
}