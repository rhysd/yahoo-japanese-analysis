module YahooJA
    class Client
        module KakariUke

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            #
            # "日本語係り受け解析" API
            #
            # @args
            #   @text text to analyze
            # @return Hash converted from XML format. more info is below.
            # @see http://developer.yahoo.co.jp/webapi/jlp/da/v1/parse.html
            # @supplementation kakari-uke service doesn't have any option
            #
            def kakari_uke text
                use_service 'http://jlp.yahooapis.jp/DAService/V1/parse',self.app_key,text
            end

        end
    end
end
