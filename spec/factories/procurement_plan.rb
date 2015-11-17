FactoryGirl.define do
  factory :procurement_plan do
    name { Faker::Name.name }
    procurement_entity_id { ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id }
    year '2015'
    procurement_plan_type 'plan 1'

    factory :invalid_procurement_plan do
      name nil
      procurement_entity_id nil
      year nil
    end  
  end
end