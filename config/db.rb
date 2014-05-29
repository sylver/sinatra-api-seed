require 'sequel'
require_relative 'env'

Sequel::Model.plugin :json_serializer
Sequel::Model.plugin :validation_helpers

DB = Sequel.connect ENV['DATABASE_URL']

# Enable usage of the sequel_pg gem to improve
# select performance by 2-6x factor
DB.optimize_model_load = true
