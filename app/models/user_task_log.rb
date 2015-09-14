class UserTaskLog < ActiveRecord::Base
	belongs_to :task
	named_scope: with_role
end
