module YahooJA
    class Client
        module Furigana

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            def furigana text,opts={}
                use_service 'http://jlp.yahooapis.jp/FuriganaService/V1/furigana',self.app_key,text,opts
            end
        end
    end
end
