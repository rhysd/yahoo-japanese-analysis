require 'yahoo-jp-ma-api/config'

module YahooMA
    class Client
        include YahooMA::Config
        attr_accessor *Config::CONFIG_KEYS

        require 'yahoo-jp-ma-api/client/keyphrase'
        include YahooMA::Client::Keyphrase

        require 'yahoo-jp-ma-api/client/morpheme_analysis'
        include YahooMA::Client::MorphemeAnalysis
    end
end
