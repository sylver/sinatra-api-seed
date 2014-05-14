#!/usr/bin/env ruby

ENV['RACK_ENV'] = 'test'

require 'minitest'
require 'minitest/autorun'
require 'rack/test'
require './app'

include Rack::Test::Methods

class MiniTest::Spec
  class << self
    alias :context :describe
  end
end

if __FILE__ == $0
  $LOAD_PATH.unshift('app', 'spec')
  Dir.glob('./**/*_spec.rb') { |f| require f }
end
