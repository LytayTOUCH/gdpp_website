FactoryGirl.define do
  factory :budget_source do
    name { Faker::Name.name }
    
    factory :invalid_budget_source do
      name nil
    end  
  end
end