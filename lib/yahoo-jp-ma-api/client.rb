require 'yahoo-jp-ma-api/config'

module YahooMA
    class Client

        include YahooMA::Config
        attr_accessor *Config::CONFIG_KEYS

        require 'yahoo-jp-ma-api/client/keyphrase'
        include YahooMA::Client::Keyphrase

        require 'yahoo-jp-ma-api/client/morpheme_analysis'
        include YahooMA::Client::MorphemeAnalysis

        require 'yahoo-jp-ma-api/client/kanji_conv'
        include YahooMA::Client::KanjiConv

        require 'yahoo-jp-ma-api/client/furigana'
        include YahooMA::Client::Furigana

        require 'yahoo-jp-ma-api/client/kousei_support'
        include YahooMA::Client::KouseiSupport

        require 'yahoo-jp-ma-api/client/kakari_uke'
        include YahooMA::Client::KakariUke

    end
end
