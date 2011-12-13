class Netrangeip
  # To change this template use File | Settings | File Templates.

  def initialize(network)
    @network=network
    @typenetwork="Netrangeip"
  end

  attr_accessor :network
  attr_reader :typenetwork


  def getnetas_arr_of_arr
    @network=self.network.split(".")
    iprange=@network.collect {|octet|
      if octet.include? "-"
        octet=octet.split("-")
        (octet[0].to_i..octet[1].to_i)
      else
        Array.new(1,octet.to_i)
      end
    }
    iprange
  end
end