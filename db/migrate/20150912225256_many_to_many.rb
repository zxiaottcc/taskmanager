class ManyToMany < ActiveRecord::Migration
  def change
  	add_column :roles_users, :user_id, :integer
  	add_column :roles_users, :role_id, :integer
  	add_foreign_key :roles_users, :users
  	add_foreign_key :roles_users, :roles

	add_column :projects_users, :user_id, :integer
  	add_column :projects_users, :project_id, :integer
  	add_foreign_key :projects_users, :users
  	add_foreign_key :projects_users, :projects

  	add_column :user_task_logs, :date, :date
  	add_column :user_task_logs, :hours, :integer
  	add_column :user_task_logs, :user_id, :integer
  	add_column :user_task_logs, :task_id, :integer
  	add_foreign_key :user_task_logs, :tasks
  	add_foreign_key :user_task_logs, :users
  end
end
