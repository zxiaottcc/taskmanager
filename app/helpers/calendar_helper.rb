module CalendarHelper
	def calendar(date = Date.today)
		cal = Calendar.new(self, date)
		cal.set_session(session)
		cal.table
	end
end
