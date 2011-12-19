class Netrangeip
  # Класс обеспечивающий методы для представления сети в виде xxx[-xxx].xxx[-xxx].xxx[-xxx].xxx[-xxx]
  # где xxx число от 0 до 255
  # при указании октета в виде xxx-yyy, yyy обязательно должно быть больше xxx

  def initialize(network)
    @network=network
    @typenetwork="Netrangeip"
  end

  attr_accessor :network
  attr_reader :typenetwork


  def getnetas_arr_of_arr
    @network.range(0,nil)


    # разделяем network на октеты ориентируясь на точки
    @network=self.network.split(".")
    # преобразуем из @network в виде [string, string, string, string] в
    # iprange в виде [array/range, array/range, array/range, array/range]
    iprange=@network.collect {|octet|
      # для каждого октета проверяем наличие -, если есть превращаем в range,
      # если нет в array с одним элементом
      if octet.include? "-"
        octet=octet.split("-")
        (octet[0].to_i..octet[1].to_i)
      else
        # возвращать array обязательно для последующего each на элементами результатов!
        Array.new(1,octet.to_i)
      end
    }
    # TODO проверить работоспособность
    #iprange
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