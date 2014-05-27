require 'config/db'

Dir['./**/*_model.rb'].each { |m| require m }
