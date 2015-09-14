class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users, id: false do |t|

      t.timestamps null: false
    end
  end
end
