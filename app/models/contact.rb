class Contact < ActiveRecord::Base
  validates :location_name, presence: true
end
