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
end