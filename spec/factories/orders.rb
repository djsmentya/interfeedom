# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    state "MyString"
    payment_state "MyString"
  end
end
