class Vino < ActiveRecord::Base
	belongs_to :terminate_point
	has_many :vlans
end
