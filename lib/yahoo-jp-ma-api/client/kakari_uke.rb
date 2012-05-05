module YahooMA
    class Client
        module KakariUke

            require 'yahoo-jp-ma-api/service_base'
            include YahooMA::ServiceBase

            # kakari-uke service doesn't have any option
            def kakari_uke text
                use_service 'http://jlp.yahooapis.jp/DAService/V1/parse',self.app_key,text
            end

        end
    end
end
