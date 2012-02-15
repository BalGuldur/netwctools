class VlansController < ApplicationController
  def index
		@vlans=Vlan.all
  end

	def rangecreate
		
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
