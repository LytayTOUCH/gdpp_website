FactoryGirl.define do
  factory :faq do
    question 'question 1'
    answer 'answer 1'
    
    factory :invalid_faq do
      question nil
      answer nil
    end  
  end
end