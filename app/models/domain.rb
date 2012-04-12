class Domain < ActiveRecord::Base

	belongs_to :myuser #correct this to has_and_belongs_to_many
	has_many :vlans
	has_many :terminate_points 
end
