require 'yahoo-japanese-analysis/client'
require 'yahoo-japanese-analysis/version'


#
# YahooJA module. You can use YahooJA class methods to use
# YahooJA::Client instance methods without instance.
# If you want to use multi-account states, you should use
# YahooJA::Client instance to use multi accounts.
#
module YahooJA
    class << self

        # override to delegate
        def method_missing name,*args,&block
            @client ||= YahooJA::Client.new
            return super unless @client.respond_to? name
            @client.send name,*args,&block
        end

        # override to delegate
        def respond_to? name,include_private=false
            @client ||= YahooJA::Client.new
            @client.respond_to?(name,include_private) || super(name,include_private)
        end

        # reset client state
        def reset
            @client = nil
        end

    end
end
