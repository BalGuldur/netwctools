class Network < ActiveRecord::Base
  # Класс предоставляющий отображение сетей в базе, и super класс для всех типов сетей
  REGOCTET="((1?\\d?\\d)|(2[1-4]\\d)|(25[1-5]))"
  REGIP="\\A(#{REGOCTET}\\.){3}#{REGOCTET}\\Z"
  REGOCTETRANGE="((#{REGOCTET})(-#{REGOCTET})?)"
  REGRANGE="\\A(#{REGOCTETRANGE}\\.){3}#{REGOCTETRANGE}\\Z"
  REGCIDR="\\A(#{REGOCTET}\\.){3}#{REGOCTET}\\/(([1-2]?\\d)|(3[012]))\\Z"
  # TODO Добавить валидацию по формату всех известных типов на networkaddress

  validates :networkaddress, :format => {:with => /#{REGRANGE}|#{REGCIDR}/}

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

    if self.networkaddress =~ /#{REGRANGE}/
      String.new("Netrangeip")
    # тут дальше должны идти в elsif другие типы
    elsif self.networkaddress=~ /#{REGCIDR}/
      String.new("Netclassless")
    else
      nil
    end
  end

  def checktype!
    # Метод запускает checktype(проверку типа сети) и присваевает своему атрибуту type
    self.type=self.checktype
  end

  def getnetas_arr_of_ip_obj
    self.getnotabstractnetwork.getnetas_arr_of_ip_obj
  end

end
