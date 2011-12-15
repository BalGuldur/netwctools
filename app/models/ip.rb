class Ip < ActiveRecord::Base
  # Таблица IP адресов связанных с оборудованием
  # TODOlater добавить валидацию на формат regexp ip

  has_and_belongs_to_many :switches

  COUNTPING =2 #>0
  INTERVALPING=0.2 #0.2 absolute minimum
  TIMEOUTPING=1 #1 absolute minimum or error ping not end
  IP_MUST_BE_UNIQUE=true #Use unique ip on table IP or no (perhaps in future be some records IP1+???1, IP1+???2

  if IP_MUST_BE_UNIQUE==true
    class_eval('validates :ipaddress, :uniqueness => true')
  end

  def createcheckip
    if IP_MUST_BE_UNIQUE==true
      self.save
    else
    end
  end

  def ping
    @strforping="ping -c #{COUNTPING} -i #{INTERVALPING} -W #{TIMEOUTPING} -q #{self.ipaddress} | grep received"
    @resping=`#{@strforping}`
    @resping=@resping.split(" ")
    if ('1'..'4').include? @resping[3]
      :online
    else
      :offline
    end
  end

end
