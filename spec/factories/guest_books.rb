# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :guest_book do
    name "MyString"
    email "MyString"
    text "MyText"
  end
end
