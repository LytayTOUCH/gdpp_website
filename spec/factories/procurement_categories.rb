FactoryGirl.define do
  factory :procurement_category do
    name { Faker::Name.name }
    
    factory :invalid_procurement_category do
      name nil
    end  
  end
end