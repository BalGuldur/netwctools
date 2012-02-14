class NetworksController < ApplicationController

  # GET
  def index
    # network - для формы новой подсети
    @network=Network.new
    # networks - для вывода таблицы с подсетями
    @networks=Network.all
  end

  # POST
  def create
    @network=Network.new(params[:network])
    # gsub заменяет , на . в случае, если пользователь ошибся при вводе
    @network.networkaddress.gsub!(",",".")
    if @network.save
      redirect_to :back
    else
      render :action => "index"
    end
  end

  # DELETE
  def destroy
    @network=Network.find(params[:id])
    @network.delete
    redirect_to :back
  end

  #GET
  def findsw
    @network=Network.find(params[:id])
    checknet=Checknet.new
    @ips=checknet.check_ips_from_network(@network)
    # TODO norm code
  end

  #GET
  def findallnetsw
    checknet=Checknet.new
    @results=checknet.checkip_from_allnetwork
    #TODO объединить findallnetws и findsw в один метод, с разными входными параметрами
  end
end
