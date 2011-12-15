class Checknet
  # Класс обеспечивающий методы опроса сетей
  def createsw(ip)
    switch=Switch.new(address: "find by autodetect")
    switch.save
    switch.ips<<ip
    switch.save
  end

  def check_ips_from_network(network)
    # Проверяем наличие у переданного аргумента необходимого метода
    if network.respond_to?(:getnetas_arr_of_ip_obj) then
      # Получаем список ip, принадлежащих этой подсети в виде массива экземпляров класса ip
      ips=network.getnetas_arr_of_ip_obj
      # Формируем массив результатов присваивая результаты (ip) действий над каждым ip в ips
      ipsres=ips.collect {|ip|
        # Если ip отвечает на пинг
        if ip.ping==:online then
          # Если ip отвечает на пинг и уже есть в базе
          if tmpip=Ip.find_by_ipaddress(ip.ipaddress)
            # Если ip отвечает на пинг, есть в базе и не привязан ни к одному свитчу
            if Ip.find_by_ipaddress(ip.ipaddress).switches.size==0 then
              self.createsw(tmpip)
              ip.state=:created
            # Если ip отвечает на пинг, есть в базе и привязан к какому-либо оборудованию
            else
              ip.state="switch with ip exist in base"
            end
          # Если ip отвечает на пинг, и его нет в базе
          else
            ip.save
            self.createsw(ip)
            ip.state=:created
          end
        # Если ip не отвечает на пинг
        else
          ip.state=:offline
        end
        ip
      }
      # Возвращаем результирующую таблицу опроса в любом случае, кроме отсутствия метода getnetas_arr_of_ip_obj
      ipsres
    else
    # TODOlater genering exception
    end
  end
end