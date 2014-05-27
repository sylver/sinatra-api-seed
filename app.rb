require 'sinatra'

require './config/env'

require 'models/all'

get "/" do
  p "Hello World !"
end
