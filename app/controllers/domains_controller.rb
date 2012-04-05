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
		@domain=Domain.first
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
		@myusers = Myuser.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
		@myusers = Myuser.all
  end

  # POST /domains
  # POST /domains.json
  def create
		if (params.has_key?(:user_id) and (params[:user_id]!=nil or params[:user_id]!=""))
			@user=Myuser.find(params[:user_id])
		else
			@newuser=Myuser.new
			@newuser.name=params[:username]
			@newuser.save
		end
    @domain = Domain.new(params[:domain])
		@domain.myuser=@newuser

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
      format.html { redirect_to domains_url }
      format.json { head :ok }
    end
  end
end
