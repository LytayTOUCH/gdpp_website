# include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :org_structure do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    # org_structure_image { fixture_file_upload 'test.pdf', 'application/pdf' }
    
    factory :invalid_org_structure do
      title nil
    end  
  end
end