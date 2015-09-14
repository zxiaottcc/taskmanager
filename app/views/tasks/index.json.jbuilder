json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :project_id, :created_by_user, :assigned_to_user, :estimated_hours, :creation_date, :completion_date
  json.url task_url(task, format: :json)
end
