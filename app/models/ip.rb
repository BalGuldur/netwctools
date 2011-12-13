class Ip < ActiveRecord::Base
  has_and_belongs_to_many :switches
end
