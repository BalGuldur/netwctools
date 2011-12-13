class NetworksController < ApplicationController
  def index
    @network=Network.new
    @networks=Network.all
  end

  # POST
  def create
    @network=Network.new(params[:network])
    @network.networkaddress.gsub!(",",".") #Заменяет , на . в введенном адресе
    if @network.save
      redirect_to :back
    else
      redirect_to "/500.html"
    end
  end

  def destroy
    @network=Network.find(params[:id])
    @network.delete
    redirect_to :back
  end

end
