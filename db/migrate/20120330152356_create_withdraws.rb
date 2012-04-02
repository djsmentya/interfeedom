class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.integer :user_id
      t.float :amount
      t.string :payment_type
      t.string :state

      t.timestamps
    end
  end
end
