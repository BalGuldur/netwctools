class Network < ActiveRecord::Base
  # Класс предоставляющий отображение сетей в базе, и super класс для всех типов сетей

  # TODO Добавить валидацию по формату всех известных типов на networkaddress

  def getnotabstractnetwork
    #Метод возвращает объект-неабстрактную сеть (классы описаны в отдельных файлах)
    #В случае, если невозможно определить тип network возвращает nil

    if typenet=self.checktype
      class_eval("#{typenet}.new\"#{self.networkaddress}\"")
    else
      nil
    end
  end

  def checktype
    #Метод определения типа сети, сравнивает networkaddress с regexp
    #в зависимости от того какой regexp подошел возвращает тип network в
    #качестве результата.
    #При этом если определить тип не удалось возвращает nil
    #TODO записать нормальные regexp

    # в условии заглушка
    if self.networkaddress =~ /\A*\z/
      String.new("Netrangeip")
    # тут дальше должны идти в elsif другие типы
    else
      nil
    end
  end

  def checktype!
    # Метод запускает checktype(проверку типа сети) и присваевает своему атрибуту type
    self.type=self.checktype
  end

  def getnetas_arr_of_arr
    #метод возвращающий в виде [integer/range,integer/range,integer/range,integer/range]
    self.getnotabstractnetwork.getnetas_arr_of_arr
  end

  def getnetas_arr_of_ip_obj
    rangeip=self.getnetas_arr_of_arr
    ips=Array.new
    rangeip[0].each {|octet1|
      rangeip[1].each {|octet2|
        rangeip[2].each {|octet3|
          rangeip[3].each {|octet4|
            ip=Ip.new
            ip.ipaddress=octet1.to_s+"."+octet2.to_s+"."+octet3.to_s+"."+octet4.to_s
            ips.push(ip)
          }
        }
      }
    }
    ips
  end

end
