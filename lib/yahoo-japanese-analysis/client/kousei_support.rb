module YahooJA
    class Client
        module KouseiSupport

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            #
            # "校正支援" API
            #
            # @args
            #   @text text to analyze
            #   @opts other options.
            # @return Hash converted from XML format. more info is below.
            # @see http://developer.yahoo.co.jp/webapi/jlp/kousei/v1/kousei.html
            #
            def kousei_support text,opts={}
                use_service 'http://jlp.yahooapis.jp/KouseiService/V1/kousei',self.app_key,text,opts
            end

        end
    end
end
