require 'rubygems'
require 'json'
require 'net/http'
require 'memcached'

$memcached = Memcached.new("localhost:11211")

module GW2Spidy
	
	def cached(cache_key)
		begin
	  		$memcached.get(cache_key)
		rescue Memcached::NotFound => e
			result = yield
		    	$memcached.set(cache_key, result, 300)
		    	result
		end
	end

	def getByID(id)
	   result = cached("#{id}") do
		   url = "http://www.gw2spidy.com/api/v0.9/json/item/#{id}"
		   resp = Net::HTTP.get_response(URI.parse(url))
		   result = JSON.parse(resp.body)

		   # if the hash has 'Error' as a key, we raise an error
		   if result.has_key? 'Error'
		      raise "web service error"
		   end

		   result["result"]
	   end
	end
end
