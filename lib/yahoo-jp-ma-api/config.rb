module YahooMA

    module Config
        DEFAULT_APP_KEY = nil

        CONFIG_KEYS = [ :app_key ]

        attr_accessor *CONFIG_KEYS

        def configure
            yield self
            self
        end

        def options
            options = {}
            CONFIG_KEYS.each do |k|
                options[k] = send k
            end
            options
        end

        def self.extended base
            base.reset
        end

        def reset
            self.app_key = DEFAULT_APP_KEY
        end
    end

end
