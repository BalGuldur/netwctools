class Vlan < ActiveRecord::Base
	has_many :subvlans, :class_name => "Vlan", :foreign_key => "bridgedomain_id"
	belongs_to :bridgedomain, :class_name => "Vlan", :foreign_key => "bridgedomain_id"

	belongs_to :vino
	belongs_to :terminate_point, :through => :vino 
	belongs_to :domain

end
