class AlarmsController < ApplicationController

	def index
		@activealarm=Alarm.find_by_enable(true)
		if @activealarm==nil
			@activealarm=Alarm.new
		end
	end
end
