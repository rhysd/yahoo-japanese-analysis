require 'yahoo-jp-ma-api/request'
require 'rexml/document'

module YahooMA
    class Client
        include YahooMA::Request

        def keyphrase text,opts={}
            raise "appid is needed" unless self.app_key
            params = {:sentence => text}.merge(opts) do |k,v1,v2|
                raise "you shouldn't set #{k} as opts. it is already set."
            end
            res = request 'http://jlp.yahooapis.jp/KeyphraseService/V1/extract',self.app_key,params
            keyphrases = {}
            doc = REXML::Document.new(res).elements['ResultSet']
            doc.elements.each('Result') do |result|
                phrase = result.elements['Keyphrase'].get_text.to_s
                score = result.elements['Score'].get_text.to_s.to_i
                keyphrases[phrase] = score
            end
            keyphrases
        end

    end
end

