# -*- encoding : utf-8 -*-
class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.integer :profile_id
      t.string :region
      t.string :city
      t.string :street
      t.integer :house_number
      t.integer :flat
      t.text :additional_info

      t.timestamps
    end
  end
end
