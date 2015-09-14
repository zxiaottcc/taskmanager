class Role < ActiveRecord::Base
	has_and_belongs_to_many :user
	belongs_to :projects_users
end
