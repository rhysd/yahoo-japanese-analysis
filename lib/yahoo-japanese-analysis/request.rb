module YahooJA
    module Request

        require 'uri'
        require 'net/http'

        def request path,app_id,params={}
            uri = URI.parse path
            queries = 'appid='+app_id+'&'+params.map{|k,v| k.to_s+'='+v.to_s}.join('&')
            req = Net::HTTP::Post.new uri.path
            res = Net::HTTP.start(uri.host,uri.port) do |http|
                http.request req, queries
            end
            res.body
        end

    end
end
