class TerminatePoint < ActiveRecord::Base
  validates :routerip, :uniqueness => true
	belongs_to :domain
	
  has_many :vinos
	has_many :vlans, :through => :vinos

	def bridgedomains
		self.vlans.find{|vlan|vlan.canbebd==true}
	end
end
