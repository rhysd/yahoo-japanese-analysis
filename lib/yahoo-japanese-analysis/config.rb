module YahooJA

    #
    # Config module.
    # You should set appid before using APIs.
    #
    module Config
        DEFAULT_APP_KEY = nil

        CONFIG_KEYS = [ :app_key ]

        attr_accessor *CONFIG_KEYS

        #
        # set appid
        #
        #   YahooJA.configure do |config|
        #       config.app_key = 'hogehoge'
        #   end
        #
        #   c = YahooJA::Client.new
        #   c.configure do |config|
        #       config.app_key = 'hogehoge'
        #   end
        #
        def configure
            yield self
            self
        end

        def options
            opts = {}
            CONFIG_KEYS.each do |k|
                opts[k] = send k
            end
            opts
        end

        def self.extended base
            base.reset
        end

        # reset config setting
        def reset
            self.app_key = DEFAULT_APP_KEY
        end
    end

end
