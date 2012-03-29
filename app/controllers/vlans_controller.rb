class VlansController < ApplicationController
  layout 'vlansupmenu'

  attr_accessor :showbds2

  def index
		@vlans=Vlan.all
		@bds=Vlan.find_all_by_canbebd(true)
		@used=true
		@used=false if params[:used]=="false"
    if params[:showbds]==nil
      @showbds=Hash.new
    else
      @showbds=params[:showbds]
    end
  end

  def allvlans
  end

  def allusedvlans
		@vlans=Vlan.find_all_by_used(true)
    render 'allvlans'
  end

  def allnotusedvlans
    @vlans=Vlan.find_all_by_used(false)
    render 'allvlans'
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
    @bd=Vlan.find(params[:bd_id]) if params[:bd_id] != ""
    @freevlan=@vino.freevlan
    @freevlan.used=true
    if params[:bd_id] != ""
      @freevlan.bridgedomain=@bd
      @freevlan.canbebd=false
    else
      @freevlan.canbebd=true
    end
    @freevlan.save
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
