require 'rubygems'
require 'bundler'
require './config/env'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require './app'
run Sinatra::Application
