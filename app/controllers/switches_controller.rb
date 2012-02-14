class SwitchesController < ApplicationController
  # GET
  def index
    # switches - для отображения всех свитчей в таблице
    @switches=Switch.all
    # switch - для отображения формы нового свитча
    @switch=Switch.new
    # ip - тоже используется в форме нового свитча
    # (для привязки ip при создании свитча)
    @ip=Ip.new
  end

  # POST
  def create
    @switch=Switch.new(params[:switch])
    # Если клиент ничего не изменял в форме, то ip будет generate
    # Соответственно это будет указывать на необходимость
    # автоматического генерирования ip для данного-нового свитча
    # Если клиент все стер... значит он хочет создать свитч без ip
    # соответственно подходит ветка else
    if params[:switch][:ip]=="generate" then#|| params[:switch][:ip]==""
      @ip=Ip.new
    # TODO @ip.generateip
    # для генерации потребуется создать выносы
    else
      #Во всех других случаях будем считать, что пользователь ввел ip
      @ip=Ip.new(ipaddress: params[:switch][:ip])
    end
    @ip.save
    @switch.save
    @switch.ips<<@ip
    redirect_to :back
  end

  # DELETE
  def destroy
    @switch=Switch.find(params[:id])
    @switch.delete
    redirect_to :back
  end

  #PUTS
  # Редактирование происходит напрямую в форме showы
  #def edit
  #  @switch=Switch.find(params[:id])
  #  @switch.update_attributes(params[:switch])
  #end

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
