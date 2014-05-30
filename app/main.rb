require 'sinatra/base'
require 'config/env'
require 'models/all'

class MainApp < Sinatra::Base

  get "/" do
    p "Hello World !"
  end

end
