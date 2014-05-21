require 'sequel'
require_relative 'env'

Sequel::Model.plugin :json_serializer
Sequel::Model.plugin :validation_helpers

DB = Sequel.connect(ENV['DATABASE_URL'])
