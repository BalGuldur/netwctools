class Switch < ActiveRecord::Base
  validates :address, :presence => true

  belongs_to :swmodel
  has_and_belongs_to_many :ips

  attr_accessor :ip
end
