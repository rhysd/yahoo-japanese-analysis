#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require './pre_test.rb'
require 'yahoo-jp-ma-api'
require 'test/unit'
require 'yaml'

class TestKeyphrase < Test::Unit::TestCase
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
end
