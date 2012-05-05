require 'yahoo-japanese-analysis/client'
require 'yahoo-japanese-analysis/version'

module YahooJA
    class << self

        # override to delegate
        def method_missing name,*args,&block
            @client ||= YahooJA::Client.new
            return super unless @client.respond_to? name
            @client.send name,*args,&block
        end

        def respond_to? name,include_private=false
            @client ||= YahooJA::Client.new
            @client.respond_to?(name,include_private) || super(name,include_private)
        end

        def reset
            @client = nil
        end

    end
end
