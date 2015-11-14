FactoryGirl.define do
  factory :announcement do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    budget_source_id { BudgetSource.find_or_create_by(attributes_for(:budget_source)).id }
    announcement_type_id { AnnouncementType.find_or_create_by(attributes_for(:announcement_type)).id }
    procurement_entity_id { ProcurementEntity.find_or_create_by(attributes_for(:procurement_entity)).id }
    open_register_date '2015-11-07'
    close_submit_date '2015-12-31'
    open_bid_doc_date '2015-11-07'
 
    factory :invalid_announcement do
      title nil
      announcement_type_id nil
      procurement_entity_id nil
      budget_source_id nil
      open_register_date nil
      close_submit_date nil
      open_bid_doc_date nil
    end  
  end
end