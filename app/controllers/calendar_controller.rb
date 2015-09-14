class CalendarController < ApplicationController
	def index
		@date = Date.today
	end
end
