# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
      genre "MyString"
      producers "MyString"
      completion_year "2011-10-18"
    end
end
