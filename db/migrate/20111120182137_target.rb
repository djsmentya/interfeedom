class Target < ActiveRecord::Migration
  def change
    create_table :target do |t|
      t.integer :user_id
      t.integer :product_id
    end
  end
end
