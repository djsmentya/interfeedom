# -*- encoding : utf-8 -*-
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.datetime :available_on
      t.integer :count_on_hand, :default => 0, :null => false
      t.integer :product_type_id,  :null => false

      t.timestamps
    end
  end
end
