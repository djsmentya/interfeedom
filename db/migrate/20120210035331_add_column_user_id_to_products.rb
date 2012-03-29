# -*- encoding : utf-8 -*-
class AddColumnUserIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_id, :integer
  end

end
