# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :law_category do
    name { Faker::Name.name }
  end

  factory :invalid_law_category do
    name nil
  end  
end
