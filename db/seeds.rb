# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


# Product types
puts 'working'
puts 'Role creating...'
  Role.create(:title => 'customer')
  Role.create(:title => 'saler')
  puts 'Product type creating...'  
  ProductType.create(:name=>'Video')
  ProductType.create(:name=>'Audio')
puts 'finished'
