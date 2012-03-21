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
    @vinos=Vino.all
    @bds=Vlan.find_all_by_canbebd(true)
  end

  def autocreate2
    @vino=Vino.find(params[:vino_id])
    @bd=Vlan.find(params[:bd_id])

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

	def vlanbdon
		@vlan=Vlan.find(params[:id])
		@vlan.canbebd=true
		@vlan.save
		redirect_to :back
	end

	def vlanbdoff
		@vlan=Vlan.find(params[:id])
		@vlan.canbebd=false
		@vlan.save
		redirect_to :back
	end

	def changebd
		@vlan=Vlan.find(params[:id])
		@bds=Vlan.find_all_by_canbebd(true)
	end

	def changebdn
		@vlan=Vlan.find(params[:id])
		@vlan.bridgedomain_id=params[:bd_id]
		@vlan.save
		redirect_to vlans_path
	end
end
