class Domain < ActiveRecord::Base

	belongs_to :myuser
	has_many :vlans
	has_and_belongs_to_many :terminate_points 
end
