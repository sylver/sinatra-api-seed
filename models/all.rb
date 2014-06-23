require 'config/db'

Dir[File.dirname(__FILE__) + '/**/*_model.rb'].each { |m| require m }
