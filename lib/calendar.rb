class Calendar < Struct.new(:view, :date)
	delegate :content_tag, to: :view

	DAYS_OF_WEEK = %W[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
	START_OF_WEEK = :sunday

	def set_session(session_)
		@session = session_
	end

	def table
		content_tag :table, class: "cal_table" do
			headers + week_rows
		end
	end

	def headers
		content_tag :tr do
			DAYS_OF_WEEK.map{ |d| content_tag :th, d}.join.html_safe
		end
	end

	def week_rows 
		weeks.map do |w|
			content_tag :tr do
				w.map {|d| content_tag :td, day_cell(d), class: day_classes(d)}.join.html_safe
			end
		end.join.html_safe
	end

	def day_cell(day)
		content_tag :div do
			s = content_tag :span, day.day.to_s
			dueTasks = Task.where({assigned_to_user: @session[:user_id], project_id: @session[:project_id], due_date: day})
			s + dueTasks.map{|task| content_tag :div do content_tag :a, task.name.to_s, href: 'tasks/'+task.id.to_s end}.join.html_safe
		end
	end

	def day_classes(day)
		classes = []
		classes << "today" if day == Date.today
		classes << "not_this_month" if day.month != date.month
		classes.join(" ")
	end

	def weeks
		startDate = date.beginning_of_month.beginning_of_week(START_OF_WEEK)
		endDate = date.end_of_month.end_of_week(START_OF_WEEK)
		(startDate..endDate).to_a.in_groups_of(7)
	end
end