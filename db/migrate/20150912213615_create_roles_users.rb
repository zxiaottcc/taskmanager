class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users, id: false do |t|

      t.timestamps null: false
    end
  end
end
