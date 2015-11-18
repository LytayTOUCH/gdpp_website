FactoryGirl.define do
  factory :law_regulation do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    law_category_id { LawCategory.find_or_create_by(attributes_for(:law_category)).id }

    factory :invalid_law_regulation do
      title nil
      law_regulation_id nil
    end  
  end
end