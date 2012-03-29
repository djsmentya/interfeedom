# -*- encoding : utf-8 -*-
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :state
      t.string :payment_state

      t.timestamps
    end
  end
end
