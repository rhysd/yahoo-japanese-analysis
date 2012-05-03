module YahooMA
    class Client
        module MorphemeAnalysis

            require 'yahoo-jp-ma-api/service_base'
            include YahooMA::ServiceBase

            def morpheme_analysis text,opts={}
                use_service 'http://jlp.yahooapis.jp/MAService/V1/parse',self.app_key,text,opts
            end

        end
    end
end
