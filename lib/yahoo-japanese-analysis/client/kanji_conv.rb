module YahooJA
    class Client
        module KanjiConv

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            #
            # "かな漢字変換" API
            #
            # @args
            #   @text text to analyze
            #   @opts other options.
            # @return Hash converted from XML format. more info is below.
            # @see http://developer.yahoo.co.jp/webapi/jlp/jim/v1/conversion.html
            #
            def kanji_conv text,opts={}
                use_service 'http://jlp.yahooapis.jp/JIMService/V1/conversion',self.app_key,text,opts
            end

        end
    end
end
