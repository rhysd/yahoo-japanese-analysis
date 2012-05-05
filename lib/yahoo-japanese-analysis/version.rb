module YahooJA
    class Version
        class << self

            def major
                0
            end

            def minor
                1
            end

            def patch
                1
            end

            def pre
                nil
            end

            def to_s
                [major, minor, patch, pre].compact!.join '.'
            end

        end
    end
end
