# encoding: utf-8
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Product].each(&:delete_all)
    users = User.all
    Product.populate 400 do |product|
      product.name = Populator.words(2..5)
      product.description = Populator.sentences(5..8)
      product.available_on = Time.new
      product.count_on_hand = 20..150
      product.created_at = 2.years.ago..Time.now
      product.price = [12.5,14.99,15.5,20,6.99]
      product.genre_id = 1
      product.product_type = ["Video","Audio"]
      if product.product_type.eql? "Video"
        product.producer = Populator.words(2)
      else
        product.style = Populator.words(1..2)
        product.group = Populator.words(1..2)
        product.album = Populator.words(1..4)
      end
    end
    idd = 0
    ids = ActiveRecord::Base.connection.select_values("select id from products")
    Target.populate 400 do |t|
      t.user_id = ActiveRecord::Base.connection.select_values("select id from users")
      t.product_id = ids[idd]
      idd +=1
    end
  end
end
