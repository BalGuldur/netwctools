class Domain < ActiveRecord::Base

	has_and_belongs_to_many :myusers #correct this to has_and_belongs_to_many
	has_many :vlans
	has_many :terminate_points 
end
