module YahooMA
    class Client
        module Furigana

            require 'yahoo-jp-ma-api/service_base'
            include YahooMA::ServiceBase

            def furigana text,opts={}
                use_service 'http://jlp.yahooapis.jp/FuriganaService/V1/furigana',self.app_key,text,opts
            end
        end
    end
end
