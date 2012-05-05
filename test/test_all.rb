#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require './pre_test.rb'
require 'yahoo-japanese-analysis'
require 'test/unit'
require 'yaml'

class TestBase < Test::Unit::TestCase

    def setup
        @appid = YAML.load(File.open('credential.yaml').read)['my_appid']
        @client = YahooJA::Client.new
    end

    def test_base_client
        assert_not_nil @client
        assert_instance_of YahooJA::Client, @client
        assert_respond_to @client,:configure
        assert_respond_to @client,:options
        assert_respond_to @client,:reset
    end

    def test_configure
        @client.configure{|config| config.app_key = @appid}
        assert_equal @client.app_key,@appid
    end

    def test_version
        assert_equal YahooJA::Version.major.class,Fixnum
        assert_equal YahooJA::Version.minor.class,Fixnum
        assert_equal YahooJA::Version.patch.class,Fixnum
        assert( !YahooJA::Version.pre || (YahooJA::Version.pre.class == String) )
        assert YahooJA::Version.to_s =~ /^\d+?\.\d+?\.\d+?.*?$/
    end

    # test YahooJA class methods for lightweight-use
    def test_gateway
        [ :configure, :options, :reset,
          :keyphrase, :morpheme_analysis, :furigana,
          :kanji_conv, :kousei_support, :kakari_uke
        ].each do |m|
            assert YahooJA.respond_to?(m),"#{m} is missing."
        end
    end

    require 'yahoo-japanese-analysis/service_base'
    include YahooJA::ServiceBase

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
        @client = YahooJA::Client.new
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
        assert_nothing_raised{ result = @client.morpheme_analysis text,{:results => "ma,uniq"} }
        assert_not_nil result
        assert_not_nil result[:ma_result][:total_count]
        assert_not_nil result[:ma_result][:word_list][:word].first[:surface]
        assert_not_nil result[:uniq_result][:total_count]
        assert_not_nil result[:uniq_result][:word_list][:word].first[:surface]
    end

    def test_furigana
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :morpheme_analysis
        text = "漢字かな交じり文にふりがなを振ること。"
        result = nil
        assert_nothing_raised{ result = @client.furigana text }
        assert_not_nil result
        assert_not_nil result[:Result][:WordList][:Word].first[:Surface]
    end

    def test_kanji_conv
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :kanji_conv
        text = "きょうはよいてんきです。"
        result = nil
        assert_nothing_raised{ result = @client.kanji_conv text }
        assert_not_nil result
        assert_not_nil result[:Result][:SegmentList][:Segment].first[:CandidateList]
    end

    def test_kousei_support
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :kousei_support
        text = "遙か彼方に小形飛行機が見える。"
        result = nil
        assert_nothing_raised{ result = @client.kousei_support text }
        assert_not_nil result
        assert_not_nil result[:Result].first[:ShitekiInfo]
    end

    def test_kakari_uke
        @client.configure{|config| config.app_key = @appid}
        assert_respond_to @client, :kakari_uke
        text = "うちの庭には二羽鶏がいます。"
        result = nil
        assert_nothing_raised{ result = @client.kakari_uke text }
        assert_not_nil result
        assert_not_nil result[:Result][:ChunkList][:Chunk].first[:MorphemList][:Morphem].first[:Feature]
    end
end
