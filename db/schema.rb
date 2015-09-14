# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150913180056) do

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.integer  "role_id",    limit: 4
  end

  add_index "projects_users", ["project_id"], name: "fk_rails_1e950bec4e", using: :btree
  add_index "projects_users", ["role_id"], name: "fk_rails_a1ee7876a0", using: :btree
  add_index "projects_users", ["user_id"], name: "fk_rails_0a98a1147c", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
  end

  add_index "roles_users", ["role_id"], name: "fk_rails_9dada905f6", using: :btree
  add_index "roles_users", ["user_id"], name: "fk_rails_e2a7142459", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "project_id",       limit: 4
    t.integer  "created_by_user",  limit: 4
    t.integer  "assigned_to_user", limit: 4
    t.integer  "estimated_hours",  limit: 4
    t.date     "creation_date"
    t.date     "completion_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "status",           limit: 4
    t.integer  "priority",         limit: 4
    t.date     "due_date"
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "user_task_logs", id: false, force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.date     "date"
    t.integer  "hours",      limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
  end

  add_index "user_task_logs", ["task_id"], name: "fk_rails_fdd50066bf", using: :btree
  add_index "user_task_logs", ["user_id"], name: "fk_rails_66a314531c", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
  end

  add_foreign_key "projects_users", "projects"
  add_foreign_key "projects_users", "roles"
  add_foreign_key "projects_users", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "user_task_logs", "tasks"
  add_foreign_key "user_task_logs", "users"
end
