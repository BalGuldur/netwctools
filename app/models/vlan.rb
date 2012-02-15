class Vlan < ActiveRecord::Base
	has_many :subvlans, :class_name => "Vlan", :foreign_key => "id"
	belongs_to :bridgedomain, :class_name => "Vlan", :foreign_key => "bridgedomain_id"

end
