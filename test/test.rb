#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require './pre_test.rb'
require 'yahoo-jp-ma-api'
require 'test/unit'
require 'yaml'

class TestKeyphrase < Test::Unit::TestCase
    def setup
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
        appid = YAML.load(File.open('credential.yaml').read)['my_appid']
        @client.configure{|config| config.app_key = appid}
        assert_equal @client.app_key,appid
    end

    def test_keyphrase
        assert_respond_to @client,:keyphrase
    end
end
