# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
      name "MyString"
      description "MyString"
      avalible_on "2011-10-18 01:11:55"
      count_on_hand 1
      category nil
    end
end