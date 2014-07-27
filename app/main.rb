require 'sinatra/base'
require 'sinatra/contrib'

require 'config/env'
require 'models/all'

class MainApp < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get "/" do
    p "Hello World !"
  end

end
