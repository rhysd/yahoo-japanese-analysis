module YahooJA
    class Client
        module MorphemeAnalysis

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            def morpheme_analysis text,opts={}
                use_service 'http://jlp.yahooapis.jp/MAService/V1/parse',self.app_key,text,opts
            end

        end
    end
end
