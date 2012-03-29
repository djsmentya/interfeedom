# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_transaction do
    order_id 1
    action "MyString"
    amount 1
    success false
    authorization "MyString"
    message "MyString"
    params "MyText"
  end
end
