# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shipping_address do
    region "MyString"
    city "MyString"
    house_number 1
    flat 1
    additional_info "MyText"
  end
end
