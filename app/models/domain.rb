class Domain < ActiveRecord::Base


	has_one :myuser
	has_many :vlans
	has_and_belongs_to_many :terminate_points 
end
