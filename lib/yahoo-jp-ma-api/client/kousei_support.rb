module YahooMA
    class Client
        module KouseiSupport

            require 'yahoo-jp-ma-api/service_base'
            include YahooMA::ServiceBase

            def kousei_support text,opts={}
                use_service 'http://jlp.yahooapis.jp/KouseiService/V1/kousei',self.app_key,text,opts
            end

        end
    end
end
