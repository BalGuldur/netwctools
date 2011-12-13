class SwitchesController < ApplicationController
  # GET
  def index
    @switches=Switch.all
    @switch=Switch.new
  end

  # POST
  def create
    @switch=Switch.new(params[:switch])
    @switch.save
    redirect_to :back
  end

  # DELETE
  def destroy
    @switch=Switch.find(params[:id])
    @switch.delete
    redirect_to :back
  end

  # PUTS
  def edit
    @switch=Switch.find(params[:id])
    @switch.update_attributes(params[:switch])
  end

  # GET
  def show
    @switch=Switch.find(params[:id])
  end

  # PUT
  def update
    @switch=Switch.find(params[:id])
    @switch.update_attributes(params[:switch])
    redirect_to :switches
  end
end
