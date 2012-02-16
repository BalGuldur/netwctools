class RangeVlan
	@range
	@vino_id

	attr_accessor :range, :vino_id

	def isrange?
		return true
	end

	def notexitstvlans?
		return true
	end

end
