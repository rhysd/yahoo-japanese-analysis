module YahooJA
    class Client
        module KanjiConv

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            def kanji_conv text,opts={}
                use_service 'http://jlp.yahooapis.jp/JIMService/V1/conversion',self.app_key,text,opts
            end

        end
    end
end
