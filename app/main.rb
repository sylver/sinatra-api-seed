require 'sinatra/base'
require 'sinatra/reloader'

require './config/env'

class MainApp < Sinatra::Base

  require 'models/all'

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    p "Hello World !"
  end

end
