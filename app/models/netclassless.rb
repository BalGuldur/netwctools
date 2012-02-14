class Netclassless
  # Класс обеспечивающий методы для представления сети в виде xxx.xxx.xxx.xxx/yy
  # где xxx число от 0 до 255, а yy число от 0 до 32

  def initialize(network)
    @network=NetAddr::CIDR.create(network)
    @typenetwork="Netclassless"
  end

  attr_accessor :network
  attr_reader :typenetwork


  def getnetas_arr_of_ip_obj
    ips=Array.new
    @network.range(0,nil).each do |ip|
      ips.push(Ip.new(ipaddress:ip))
    end
    ips
  end

end