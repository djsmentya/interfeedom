class AddColumnPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :float, :default => 0.0, :null => false
  end
end
