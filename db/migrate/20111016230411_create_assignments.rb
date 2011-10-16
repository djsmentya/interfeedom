class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :user_id
      t.string :role_id

      t.timestamps
    end
  end
end
