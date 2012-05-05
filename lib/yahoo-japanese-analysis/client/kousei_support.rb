module YahooJA
    class Client
        module KouseiSupport

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            def kousei_support text,opts={}
                use_service 'http://jlp.yahooapis.jp/KouseiService/V1/kousei',self.app_key,text,opts
            end

        end
    end
end
