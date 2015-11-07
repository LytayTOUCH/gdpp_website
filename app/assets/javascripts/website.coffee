# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
  
  $('.datatable').DataTable 'language':
    'lengthMenu': 'បង្ហាញ _MENU_ ក្នុងមួយទំព័រ'
    'zeroRecords': 'មិនមានទិន្នន័យដែលបានស្វែងរក - សូមទោស'
    'info': 'បង្ហាញ _PAGE_ នៃ _PAGES_ ទំព័រ'
    'infoEmpty': 'មិនមានទិន្នន័យក្នុងតារាង'
    'infoFiltered': '(បានតម្រង _MAX_ ជួរដេកនៃទន្នន័យសរុប)'
    'search': 'ស្វែងរក'
    "paginate":
      "first": "ដំបូង"
      "last": "ចុងក្រោយ"
      "next": "បន្ទាប់"
      "previous": "មុន"

  # $('#example').DataTable()
