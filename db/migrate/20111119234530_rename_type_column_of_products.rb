# -*- encoding : utf-8 -*-
class RenameTypeColumnOfProducts < ActiveRecord::Migration
  def change 
    rename_column :products, :type,:product_type
  end

end
