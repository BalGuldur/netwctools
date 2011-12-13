class SwmodelsController < ApplicationController

  # GET
  def index
    @swmodels=Swmodel.all
    @swmodel=Swmodel.new
  end
  
  def destroy
    @swmodel=Swmodel.find(params[:id])
    @swmodel.destroy
    redirect_to :back
  end
  
  def show
    @swmodel=Swmodel.find(params[:id])
  end
  
  def create
    @swmodel=Swmodel.new(params[:swmodel])
    @swmodel.save!
    redirect_to :back
  end

  def update
    @swmodel=Swmodel.find(params[:id])
    @swmodel.update_attributes(params[:swmodel])
    redirect_to swmodels_path
  end
end
