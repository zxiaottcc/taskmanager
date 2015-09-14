class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :project, index: true, foreign_key: true
      t.integer :created_by_user
      t.integer :assigned_to_user
      t.integer :estimated_hours
      t.date :creation_date
      t.date :completion_date

      t.timestamps null: false
    end
  end
end
