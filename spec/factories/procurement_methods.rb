# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :procurement_method do
    name { Faker::Name.name }
    
    factory :invalid_procurement_method do
      name nil
    end
  end
end
