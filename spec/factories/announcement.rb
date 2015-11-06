FactoryGirl.define do
  factory :announcement do
    name { Faker::Name.name }
    
    factory :invalid_announcement do
      name nil
    end  
  end
end