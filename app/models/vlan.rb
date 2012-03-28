class Vlan < ActiveRecord::Base
	has_many :subvlans, :class_name => "Vlan", :foreign_key => "bridgedomain_id"
	belongs_to :bridgedomain, :class_name => "Vlan", :foreign_key => "bridgedomain_id"

	belongs_to :vino
	has_one :terminatepoints, :through => :vino 

end
