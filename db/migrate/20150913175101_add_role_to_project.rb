class AddRoleToProject < ActiveRecord::Migration
  def change
  	#add_column :projects_users, :role_id, :integer
  	add_foreign_key :projects_users, :roles
  end
end
