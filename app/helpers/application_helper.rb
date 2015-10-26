module ApplicationHelper
  def gmap_lib
    javascript_include_tag 'https://maps.googleapis.com/maps/api/js?sensor=false'
  end

  def ingetrate_protnote
    javascript_include_tag 'http://www.protonotes.com/js/protonotes.js'
  end

end
