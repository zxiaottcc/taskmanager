class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :users
  has_many :task_user_logs

  enum status: [:new_task, :assigned, :working, :readyfortest, :verified, :released, :closed, :reopened]
end
