class DomainsController < ApplicationController
	layout 'vlansupmenu'

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @domains }
    end
  end

	def rezervrangevlan 
		@domain=Domain.find(params[:id])
	end

	def genfromrange
		@range=Rangevlan.new
		@range.range=params[:range]
		@range.domain_id=params[:id]
		if @range.isrange? and @range.notexistvlans?
			@range.createvlansindb
			redirect_to vlans_path
		else
			redirect_to :back
		end
  end

  # GET /domains/new
  # GET /domains/new.json
  def new
    @domain = Domain.new
		@myuser=Myuser.find(params[:myuser_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
		@myusers = Myuser.all
		@myuser = Myuser.find(params[:myuser_id])
  end

  # POST /domains
  # POST /domains.json
  def create
		@myuser=Myuser.find(params[:myuser_id])
    @domain = Domain.new(params[:domain])
		@domain.myusers<<@myuser

    respond_to do |format|
      if @domain.save
        format.html { redirect_to vlans_path, notice: 'Domain was successfully created.' }
        format.json { render json: @domain, status: :created, location: @domain }
      else
        format.html { render action: "new" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /domains/1
  # PUT /domains/1.json
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        format.html { redirect_to vlans_path, notice: 'Domain was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain = Domain.find(params[:id])
    @domain.destroy
    respond_to do |format|
			if @domain.terminate_points.size != 0 
				format.html { redirect_to vlans_url }
				format.json { head :ok }
			else
				format.html { redirect_to :back, notice: "Can't delete, before delete terminate points"}
				format.json { render json: @domain.errors, status: :unprocessable_entity }
			end
    end
  end
end
