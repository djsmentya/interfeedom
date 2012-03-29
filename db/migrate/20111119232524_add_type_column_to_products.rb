# -*- encoding : utf-8 -*-
class AddTypeColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :type, :string
  end
 end
