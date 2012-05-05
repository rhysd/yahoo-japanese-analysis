module YahooMA
    class Client
        module KanjiConv

            require 'yahoo-jp-ma-api/service_base'
            include YahooMA::ServiceBase

            def kanji_conv text,opts={}
                use_service 'http://jlp.yahooapis.jp/JIMService/V1/conversion',self.app_key,text,opts
            end

        end
    end
end
