class VlansController < ApplicationController
  # GET /vlans
  # GET /vlans.json
  def index
    @vlans = Vlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vlans }
    end
  end

  # GET /vlans/1
  # GET /vlans/1.json
  def show
    @vlan = Vlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vlan }
    end
  end

  # GET /vlans/new
  # GET /vlans/new.json
  def new
    @vlan = Vlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vlan }
    end
  end

  # GET /vlans/1/edit
  def edit
    @vlan = Vlan.find(params[:id])
  end

  # POST /vlans
  # POST /vlans.json
  def create
    @vlan = Vlan.new(params[:vlan])

    respond_to do |format|
      if @vlan.save
        format.html { redirect_to @vlan, notice: 'Vlan was successfully created.' }
        format.json { render json: @vlan, status: :created, location: @vlan }
      else
        format.html { render action: "new" }
        format.json { render json: @vlan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vlans/1
  # PUT /vlans/1.json
  def update
    @vlan = Vlan.find(params[:id])

    respond_to do |format|
      if @vlan.update_attributes(params[:vlan])
        format.html { redirect_to @vlan, notice: 'Vlan was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vlan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vlans/1
  # DELETE /vlans/1.json
  def destroy
    @vlan = Vlan.find(params[:id])
    @vlan.destroy

    respond_to do |format|
      format.html { redirect_to vlans_url }
      format.json { head :ok }
    end
  end
end
