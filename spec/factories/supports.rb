# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :support do
    subject "MyString"
    email "MyString"
    message "MyText"
  end
end