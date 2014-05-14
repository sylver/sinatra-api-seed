require './config/env'
require 'sequel'
Sequel::Model.plugin :json_serializer
DB = Sequel.connect(ENV['DATABASE_URL'])
