class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps
    end
    Role.create(:title=>'admin')
    Role.create(:title=>'costumer')
  end
end
