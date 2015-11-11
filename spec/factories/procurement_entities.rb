FactoryGirl.define do
  factory :procurement_entity do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.city }
    website 'www.gdpp.com'
    procurement_category_id { ProcurementCategory.find_or_create_by(attributes_for(:procurement_category)).id }
    
    factory :invalid_procurement_entity do
      name nil
      phone nil
      address nil
      website nil
      procurement_category_id nil
    end  
  end
end