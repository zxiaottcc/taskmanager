class AddNameToUserRoleToProjectUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :projects_users, :role_id, :integer
  end
end
