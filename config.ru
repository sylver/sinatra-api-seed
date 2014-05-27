#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
require './config/env'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

# Choose one of the 2 Sinatra style :

# Classic
#require './app'
#run Sinatra::Application

# Modular
#require 'app/main'
#run MainApp
