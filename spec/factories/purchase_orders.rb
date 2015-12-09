# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase_order do
    project_name "MyString"
    procurement_method nil
    procurement_category nil
    purchase_order_date "2015-11-20"
  end
end
