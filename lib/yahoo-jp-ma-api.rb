require 'yahoo-jp-ma-api/client'
require 'yahoo-jp-ma-api/config'

module YahooMA
    extend Config

    class << self
        def new options={}
            @client ||= YahooMA::Client.new options
        end

        # override to delegate
        def method_missing name,*args,&block
            return super if @client.respond_to? name
            @client.send name,*args,&block
        end

        def respond_to? name,include_private=false
            @client.respond_to?(name,include_private) || super(name,include_private)
        end
    end
end
