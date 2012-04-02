class Myuser < ActiveRecord::Base
  has_many :vinos
	has_many :vlans, :through => :vinos
end
