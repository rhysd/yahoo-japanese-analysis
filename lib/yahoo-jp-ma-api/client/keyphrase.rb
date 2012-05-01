require 'yahoo-jp-ma-api/request'
require 'rexml/document'

module YahooMA
    class Client
        include YahooMA::Request

        def keyphrase params
            raise "keyphrase requires following params: sentence" unless  params.include? :sentence
            raise "appid is needed" unless self.app_key
            res = request 'http://jlp.yahooapis.jp/KeyphraseService/V1/extract',self.app_key,params
            keyphrases = {}
            puts res
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

