class Vino < ActiveRecord::Base
  belongs_to :myuser
	belongs_to :terminate_point
	has_many :vlans

  def freevlan
    return self.vlans.find_by_used(false)
  end

end
