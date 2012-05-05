module YahooJA
    class Client
        module MorphemeAnalysis

            require 'yahoo-japanese-analysis/service_base'
            include YahooJA::ServiceBase

            #
            # "日本語形態素解析" API (Japanese Morpheme Analysis)
            #
            # @args
            #   @text text to analyze
            #   @opts other options.
            # @return Hash converted from XML format. more info is below.
            # @see http://developer.yahoo.co.jp/webapi/jlp/ma/v1/parse.html
            #
            def morpheme_analysis text,opts={}
                use_service 'http://jlp.yahooapis.jp/MAService/V1/parse',self.app_key,text,opts
            end

        end
    end
end
