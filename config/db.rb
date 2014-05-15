require 'sequel'
require_relative 'env'

Sequel::Model.plugin :json_serializer
DB = Sequel.connect(ENV['DATABASE_URL'])
