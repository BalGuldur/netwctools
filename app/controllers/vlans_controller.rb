class VlansController < ApplicationController
  def index
		@vlans=Vlan.all
  end

	def rangecreate
		#@range=Rangevlan.new
		@vlans=Vlan.all
		@vinos=Vino.all
	end

	def genfromrange
		@range=Rangevlan.new
		@range.range=params[:range]
		@range.vino_id=params[:vino_id]
		if @range.isrange? and @range.notexistvlans?
			@range.createvlansindb
			redirect_to vlans_path
		else
			redirect_to :back
		end
	end

  def autocreate
  end

  def manualcreate
  end

  def destroy
		@vlan=Vlan.find(params[:id])
		@vlan.destroy
		redirect_to :back
  end

  def edit
  end

end
