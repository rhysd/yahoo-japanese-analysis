require 'rexml/document'
require 'uri'
require 'net/http'
require 'yahoo-jp-ma-api/config.rb'

module YahooMA
    module Request
        def request path,app_id,params={}
            uri = URI.parse path
            queries = params.map{|k,v| k.to_s+'='+v.to_s}.join('&')
            req = Net::HTTP::Post.new uri.path
            res = Net::HTTP.start(url.host,url.port) do |http|
                http.request req, query
            end
            res
        end
    end
end
