require 'yahoo-jp-ma-api/request'
require 'rexml/document'

module YahooMA
    class Client
        module Keyphrase
            def keyphrase params
                raise "keyphrase requires following params: sentence" unless  params.include? :sentence
                res = request 'http://jlp.yahooapis.jp/KeyphraseService/V1/extract',app_key,params
                keyphrases = []
                doc = REXML::Document.new(body).elements['ResultSet/']
                doc.elements.each('Result') do |result|
                    keyphrases[result['Keyphrase'].text] = result['Score'].text.to_i
                end
                keyphrases
            end
        end
    end
end

