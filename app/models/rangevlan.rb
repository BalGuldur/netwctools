class Rangevlan
	@range
	@domain_id

	attr_accessor :range, :domain_id

	def isrange?
		# regexp описывает типа х, или х-х, где х от 0 до 3999
		return /\A(\d{1,3}|[123]\d{1,3})(\-(\d{1,3}|[123]\d{1,3}))?\z/.match self.range
	end

	def notexistvlans?
		simplyvlans=Domain.find(@domain_id).terminate_points.collect{|tp|tp.vlans}
		simplyvlansid=simplyvlans.collect{|vlan|vlan.vlanpvid}
		(self.getrangeasrange.to_a & simplyvlansid).size==0
	end
	
	def createvlansindb
		self.getrangeasrange.each do |vlanpv|
			vlan=Vlan.new(:vlanpvid => vlanpv, :domain_id => self.domain_id, :canbebd => false, :used => false)
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
