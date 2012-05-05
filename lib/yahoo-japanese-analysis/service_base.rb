module YahooJA
    module ServiceBase

        require 'rexml/document'

        require 'yahoo-japanese-analysis/request'
        include YahooJA::Request

        def use_service url,appid,text,opts={}
            raise "appid is needed" unless appid
            params = {:sentence => text}.merge(opts) do |k,v1,v2|
                raise "you shouldn't set #{k} as opts. it is already set."
            end
            res = request url, appid, params

            doc = REXML::Document.new(res)
            xml_to_hash(REXML::Document.new(res))[:ResultSet]
        end

        private

        def xml_to_hash rexml
            xml_elem_to_hash rexml.root
        end

        def xml_elem_to_hash elem
            value = if elem.has_elements?
                children = {}
                elem.each_element do |e|
                    # children << xml_elem_to_hash(e)
                    children.merge!(xml_elem_to_hash(e)) do |k,v1,v2|
                        if v1.class == Array
                            v1 << v2
                        else
                            [v1,v2]
                        end
                    end
                end
                children
            else
                elem.text
            end
            { elem.name.to_sym => value }
        end

    end
end
