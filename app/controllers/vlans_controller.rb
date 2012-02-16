class VlansController < ApplicationController
  def index
		@vlans=Vlan.all
  end

	def rangecreate
		@range=RangeVlan.new
		@vlans=Vlan.all
	end

	def genfromrange
	end

  def autocreate
  end

  def manualcreate
  end

  def destroy
  end

  def edit
  end

end
