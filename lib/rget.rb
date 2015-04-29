require "rget/version"
require 'net/http'
require 'json'

module Rget
	def get_image(img_url)
		url = URI(img_url)

		IMAGE_REGEX = /[^\/*]*(png|jpg|jpeg|bmp|tiff|gif)/i

		if url.to_s =~ IMAGE_REGEX && Net::HTTP.get_response(url).code == "200"
			file = Net::HTTP.get(url)
			name = url.to_s.match IMAGE_REGEX
			File.write("#{name}",file)
		else
			puts "fail."
		end
	end
end
