require 'yahoo-jp-ma-api/config'

module YahooMA
    class Client
        require 'yahoo-jp-ma-api/client/keyphrase'
        include YahooMA::Client::Keyphrase

        include YahooMA::Config

        attr_accessor *Config::CONFIG_KEYS

        def initialize attrs={}
            attrs = self.options.merge attrs
            Config::CONFIG_KEYS.each do |key|
                instance_variable_set "@#{key}".to_sym, attrs[key]
            end
        end

    end
end
