class TerminatePoint < ActiveRecord::Base
  validates :routerip, :uniqueness => true
	
  has_many :vinos
	has_many :vlans, :through => :vinos
end
