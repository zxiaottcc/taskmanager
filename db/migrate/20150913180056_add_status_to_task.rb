class AddStatusToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :status, :integer
  	add_column :tasks, :priority, :integer
  	add_column :tasks, :due_date, :date
  end
end
