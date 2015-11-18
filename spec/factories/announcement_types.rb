FactoryGirl.define do
  factory :announcement_type do
    name { Faker::Name.name }
    
    factory :invalid_announcement_type do
      name nil
    end  
  end
end