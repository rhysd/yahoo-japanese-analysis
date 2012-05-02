class Hash
    class << self

        def from_xml rexml
            xml_elem_to_hash rexml.root
        end

        private

        def xml_elem_to_hash elem
            if elem.has_elements?
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
                return { elem.name.to_sym => children }
            else
                return { elem.name.to_sym => elem.text }
            end
        end

    end
end
