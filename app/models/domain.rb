class Domain < ActiveRecord::Base

	belongs_to :myuser
	has_many :vlans
	has_many :terminate_points 
end
