module YahooJA
    class Client
        module Furigana

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            #
            # "ルビ振り" API
            #
            # @args
            #   @text text to analyze
            #   @opts other options.
            # @return Hash converted from XML format. more info is below.
            # @see http://developer.yahoo.co.jp/webapi/jlp/furigana/v1/furigana.html
            #
            def furigana text,opts={}
                use_service 'http://jlp.yahooapis.jp/FuriganaService/V1/furigana',self.app_key,text,opts
            end
        end
    end
end
