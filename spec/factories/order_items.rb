# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    order_id 1
    product_id 1
    quantity 1
  end
end
