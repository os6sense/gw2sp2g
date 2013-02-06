require 'rubygems'
require 'json'
require 'net/http'
require 'memcached'

$memcache = Memcached.new("localhost:11211")

# GW2Spidy - a simple interface to GW2Spidy's json api
# This is not particularly robust and if spidy is down it fails spectacularly
# it needs to fall back to an alternate service

module GW2Spidy
    # getByID - retrieve the parsed values for a given ID from memcache.
    # if the value isn't found, attempt to set the value which should
    # return a valid value if successful
    def getByID(id)
        begin
            $memcache.get("#{id}")
        rescue Memcached::NotFound => e
            warn "SETTING ID #{id}" if $DEBUG
            setByID(id)
        end
    end

    # cached - determine if a key exists in memcache, return it if found,
    # or get the value for the key and set it otherwise.
    # cache_key:: Key to search for in the cache
    def cached(cache_key)
        begin
            result = yield
            $memcache.set(cache_key, result, 7200)
            warn "Component #{cache_key} Set Successfully" 
            result
        rescue
            {}
        end
    end

    # setById - get information from www.gw2spidy.com via the json api
    # for a given id
    # id:: id to look up on gw2spidy
    def setByID(id)
        puts "LOOKING UP #{id}" if $DEBUG
        result = cached("#{id}") do
            url = "http://www.gw2spidy.com/api/v0.9/json/item/#{id}"
            resp = Net::HTTP.get_response(URI.parse(url))

            begin
                result = JSON.parse(resp.body)
            rescue JSON::ParserError
                # sometimes spidy returns results with "Warning" lines - find the first {
                # and attempt to parse what remains after that
                begin
                    warn "PARSING ERROR #{id}"
                    c_resp = resp.body[resp.body.index("{"), resp.body.size ]
                    result = JSON.parse(c_resp)
                rescue
                    warn "UNRECOVERABLE: (#{id})"
                end
            end

            # raise an error if 'Error' is a key
            if result.has_key? 'Error'
                raise "web service error"
            end

            result["result"]
        end
    end
end
