class Autologin
	REGMACOCTET="([\dA-F]{2})"
	REGMAC="\\A(#{REGMACOCTET}:?
  REGOCTET="((1?\\d?\\d)|(2[1-4]\\d)|(25[1-5]))"
  REGIP="\\A(#{REGOCTET}\\.){3}#{REGOCTET}\\Z"


	@username
	@password
	@macorip

	attr_accessor :username, :password, :macorip

	def ok?
		if ((/\A\d{5}_\d(@spb)?\z/.match @username) and (/\A\S*\z/.match @password) and (/#{REGIP}/.match @macorip or /#{REGMAC}/.match @macorip)) 
			return true
		else
			return false
		end
	end
end
