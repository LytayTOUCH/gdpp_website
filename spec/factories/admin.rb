FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.email }
    password '12345678'
    password_confirmation { password }
    username { Faker::Name.name }
    
    factory :invalid_admin do
      email nil
      password nil
      password_confirmation nil
      username nil
    end  
  end
end