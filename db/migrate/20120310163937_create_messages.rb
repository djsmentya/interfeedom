# -*- encoding : utf-8 -*-
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :to_user_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
