require 'yahoo-jp-ma-api/request'
require 'yahoo-jp-ma-api/utility'
require 'rexml/document'

module YahooMA
    class Client
        module MorphemeAnalysis
            include YahooMA::Request

            def morpheme_analysis text,opts={}
                raise "appid is needed" unless self.app_key
                params = {:sentence => text}.merge(opts) do |k,v1,v2|
                    raise "you shouldn't set #{k} as opts. it is already set."
                end
                res = request 'http://jlp.yahooapis.jp/MAService/V1/parse', self.app_key,params

                doc = REXML::Document.new(res)
                Hash.from_xml doc
            end

        end
    end
end
