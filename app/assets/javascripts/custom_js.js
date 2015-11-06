$(document).on('page:change', function() {
  $('#my_datatable').DataTable({
      'language': {
        'lengthMenu': 'បង្ហាញ _MENU_ ក្នុងមួយទំព័រ',
        'zeroRecords': 'មិនមានទិន្នន័យដែលបានស្វែងរក - សូមទោស',
        'info': 'បង្ហាញ _PAGE_ នៃ _PAGES_ ទំព័រ',
        'infoEmpty': 'No records available',
        'infoFiltered': '(filtered from _MAX_ total records)',
        'search': 'ស្វែងរក',
        "paginate": {
          "first": "ដំបូង",
          "last": "ចុងក្រោយ",
          "next": "បន្ទាប់",
          "previous": "មុន"
        }
      }
  });
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