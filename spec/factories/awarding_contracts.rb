# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :awarding_contract do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    procurement_method_id { ProcurementMethod.find_or_create_by(attributes_for(:procurement_method)).id }

    factory :invalid_awarding_contract do
      title nil
      procurement_method_id nil
    end  
  end
end
