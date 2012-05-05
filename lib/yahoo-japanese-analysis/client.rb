require 'yahoo-japanese-analysis/config'

module YahooJA

    #
    # Client to use Yahoo! Japan Text Analysis API.
    #
    class Client

        include YahooJA::Config
        attr_accessor *Config::CONFIG_KEYS

        require 'yahoo-japanese-analysis/client/keyphrase'
        include YahooJA::Client::Keyphrase

        require 'yahoo-japanese-analysis/client/morpheme_analysis'
        include YahooJA::Client::MorphemeAnalysis

        require 'yahoo-japanese-analysis/client/kanji_conv'
        include YahooJA::Client::KanjiConv

        require 'yahoo-japanese-analysis/client/furigana'
        include YahooJA::Client::Furigana

        require 'yahoo-japanese-analysis/client/kousei_support'
        include YahooJA::Client::KouseiSupport

        require 'yahoo-japanese-analysis/client/kakari_uke'
        include YahooJA::Client::KakariUke

    end
end
