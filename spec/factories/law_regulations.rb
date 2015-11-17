FactoryGirl.define do
  factory :law_regulation do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }

    factory :invalid_law_regulation do
      title nil
    end  
  end
end