require 'yahoo-jp-ma-api/config'

module YahooMA
    class Client
        include YahooMA::Config
        attr_accessor *Config::CONFIG_KEYS

        require 'yahoo-jp-ma-api/client/keyphrase'
        include YahooMA::Client::Keyphrase

        # def initialize attrs={}
        #     attrs = self.options.merge attrs
        #     Config::CONFIG_KEYS.each do |key|
        #         instance_variable_set "@#{key}".to_sym, attrs[key]
        #     end
        # end

    end
end
