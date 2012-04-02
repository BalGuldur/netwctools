class VlansController < ApplicationController
  layout 'vlansupmenu'

	def index
		@domains=Domain.all
	end

	def dispvlans
		@user=params.has_key?(:user) ? params[:user] : nil
		@used=params.has_key?(:used) ? (params[:used]=='true' ? true : false) : true
		@showbds=params.has_key?(:showbds) ? params[:showbds] : Hash.new

		@vlans=(@user!=nil ? Myuser.find(@user).vlans : Vlan.all)
		@bds=@vlans
		@bds=@bds.find_all{|bd|bd.canbebd==true}
		@vlans.find_all{|vlan|vlan.used==@used}
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
