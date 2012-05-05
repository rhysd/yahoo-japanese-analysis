module YahooJA
    class Client
        module KakariUke

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            # kakari-uke service doesn't have any option
            def kakari_uke text
                use_service 'http://jlp.yahooapis.jp/DAService/V1/parse',self.app_key,text
            end

        end
    end
end
