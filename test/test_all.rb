#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require './pre_test.rb'
require 'yahoo-jp-ma-api'
require 'test/unit'
require 'yaml'

class TestBase < Test::Unit::TestCase

    def setup
        @appid = YAML.load(File.open('credential.yaml').read)['my_appid']
        @client = YahooMA::Client.new
    end

    def test_base_client
        assert_not_nil @client
        assert_instance_of YahooMA::Client, @client
        assert_respond_to @client,:configure
        assert_respond_to @client,:options
        assert_respond_to @client,:reset
    end

    def test_configure
        @client.configure{|config| config.app_key = @appid}
        assert_equal @client.app_key,@appid
    end

    require 'yahoo-jp-ma-api/service_base'
    include YahooMA::ServiceBase

    # test xml_to_hash
    def test_service_base

        xml_pairs = {}
        xml_pairs['<result><info><title>Title1</title><data>1234</data></info><info><title>Title2</title><data>5678</data></info></result>'] = {:result=>{:info=>[{:title=>"Title1", :data=>"1234"}, {:title=>"Title2", :data=>"5678"}]}}
        xml_pairs['<hoge></hoge>'] = {:hoge=>nil}
        xml_pairs['<hoge><foo><bar>piyo</bar></foo></hoge>'] = {:hoge=>{:foo=>{:bar=>"piyo"}}}

        # work around to test private method in block.
        xml_to_hash_method = method(:xml_to_hash).to_proc
        xml_pairs.each do |xml,expected|
            rexml = REXML::Document.new xml
            result = xml_to_hash_method.call rexml
            assert_equal result,expected
        end
    end

end

class TestFeatures < Test::Unit::TestCase

    def setup
        @appid = YAML.load(File.open('credential.yaml').read)['my_appid']
        @client = YahooMA::Client.new
    end

    def test_keyphrase
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client,:keyphrase
        text = "RubyやC++も良いけれど，そろそろHaskellを習得したいなぁ．"
        result = nil
        assert_nothing_raised{ result = @client.keyphrase text }
        assert_not_nil result
        assert_not_nil result['Ruby']
        assert_not_nil result['Haskell']
        assert_not_nil result['C']
    end

    def test_morpheme_analysis
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :morpheme_analysis
        text = "庭には二羽ニワトリがいる。"
        result = nil
        assert_nothing_raised{ result = @client.morpheme_analysis text }
        assert_not_nil result
        assert_not_nil result[:ResultSet][:ma_result]
    end

    def test_furigana
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :morpheme_analysis
        text = "漢字かな交じり文にふりがなを振ること。"
        result = nil
        assert_nothing_raised{ result = @client.morpheme_analysis text }
        assert_not_nil result
        assert_not_nil result[:ResultSet][:ma_result]
        p result
    end
end
