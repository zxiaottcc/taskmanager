# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DatabaseCleaner.strategy = :truncation, {:only => %w[users], reset_ids: true}
DatabaseCleaner.clean
DatabaseCleaner.strategy = :truncation, {:only => %w[roles], reset_ids: true}
DatabaseCleaner.clean
DatabaseCleaner.strategy = :truncation, {:only => %w[projects], reset_ids: true}
DatabaseCleaner.clean
DatabaseCleaner.strategy = :truncation, {:only => %w[tasks], reset_ids: true}
DatabaseCleaner.clean
DatabaseCleaner.strategy = :truncation, {:only => %w[roles_users], reset_ids: true}
DatabaseCleaner.clean
DatabaseCleaner.strategy = :truncation, {:only => %w[projects_users], reset_ids: true}
DatabaseCleaner.clean

zuser = User.create({username: 'zxiao', password: 'password'})
cuser = User.create({username: 'cpierson', password: 'password'})
wuser = User.create({username: 'william', password: 'password'})
muser = User.create({username: 'mblack', password: 'password'})

arole = Role.create({name: 'admin'})
drole = Role.create({name: 'developer'})
mrole = Role.create({name: 'manager'})

RolesUser.create({user_id: zuser.id, role_id: drole.id})
RolesUser.create({user_id: zuser.id, role_id: arole.id})

cproject = Project.create({name: 'care plans', description: 'this is a long description of care plans'})
gproject = Project.create({name: 'genealogy', description: 'this is a genealogy project'})

ProjectsUser.create({project_id: cproject.id, user_id: zuser.id, role_id: drole.id})
ProjectsUser.create({project_id: cproject.id, user_id: cuser.id, role_id: mrole.id})
ProjectsUser.create({project_id: cproject.id, user_id: wuser.id, role_id: mrole.id})

dTask = Task.create({name: 'database creation', project_id: cproject.id, created_by_user: zuser.id, assigned_to_user: zuser.id, estimated_hours: 10, due_date: Date.today + 2, status: 1})
dTask = Task.create({name: 'er diagram', project_id: cproject.id, created_by_user: zuser.id, assigned_to_user: zuser.id, estimated_hours: 5, due_date: Date.today + 3, status: 1})
dTask = Task.create({name: 'test scripts', project_id: cproject.id, created_by_user: zuser.id, assigned_to_user: zuser.id, estimated_hours: 10, due_date: Date.today + 5, status: 1})



