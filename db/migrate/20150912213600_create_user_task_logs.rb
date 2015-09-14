class CreateUserTaskLogs < ActiveRecord::Migration
  def change
    create_table :user_task_logs, id: false do |t|

      t.timestamps null: false
    end
  end
end
