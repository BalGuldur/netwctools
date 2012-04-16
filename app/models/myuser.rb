class Myuser < ActiveRecord::Base
	has_and_belongs_to_many :domains #correct this to has_and_belongs_to_many
end
