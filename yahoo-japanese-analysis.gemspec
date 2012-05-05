require File.expand_path '../lib/yahoo-japanese-analysis/version',__FILE__

Gem::Specification.new do |s|
    s.name                  =  'yahoo-japanese-analysis'
    s.version               =  YahooJA::Version.to_s
    s.date                  =  Time.now.to_s.split.first
    s.summary               =  "Japanese Analysis API Wrapper."
    s.description           =  "Yahoo! Japan Text Analysis API Wrapper."
    s.authors               =  ["rhysd"]
    s.email                 =  'lin90162@yahoo.co.jp'
    s.require_paths         =  ['lib']
    s.files                 =  `git ls-files`.split("\n")
    s.test_files            =  ['test/test_all.rb']
    s.homepage              =  'https://github.com/rhysd/yahoo-japanese-analysis'
    s.license               =  'MIT'
    s.required_ruby_version = '>= 1.9.2'
end
