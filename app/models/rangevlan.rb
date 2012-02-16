class Rangevlan
	@range
	@vino_id

	attr_accessor :range, :vino_id

	def isrange?
		return true
	end

	def notexistvlans?
		return true
	end
	
	def createvlansindb
		self.getrangeasrange.each do |vlanpv|
			vlan=Vlan.new(:vlanpvid => vlanpv, :vinos_id => self.vino_id)
			vlan.save
		end
	end

	def getrangeasrange
		if self.range.include? "-"
			range=self.range.split("-")
			(range[0].to_i..range[1].to_i)
		else
			Array.new(1,range.to_i)
		end
	end

end
