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

  if($('#map').length ){
    initMap();
  }
})

function initMap() {
  var myLatLng = {lat: 11.5764052, lng: 104.9204733};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: myLatLng
  });

  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Ministry of economy and finance'
  });
}