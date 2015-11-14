FactoryGirl.define do
  factory :public_service do
    name { Faker::Name.name }
    position 'normal'
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    
    factory :invalid_public_service do
      name nil
      position nil
      phone nil
      email nil
    end  
  end
end