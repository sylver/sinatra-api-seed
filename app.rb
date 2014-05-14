require 'sinatra'
require 'json'
require './config/env'

configure do
  require './config/db'
  Dir['./models/*.rb'].each{|m| require m}
end

get "/" do
  p "Hello World !"
end
