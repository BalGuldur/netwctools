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
      redirect_to "/500.html"
    end
  end

  # DELETE
  def destroy
    @network=Network.find(params[:id])
    @network.delete
    redirect_to :back
  end
end
