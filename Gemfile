source 'https://rubygems.org'

# Common
gem 'rake'
gem 'json'

# Framework
gem 'sinatra'
gem 'sinatra-contrib'

# DB
gem 'sequel'
gem 'pg'
gem 'sequel_pg', :require=>'sequel'

# Utils
gem 'rfc822'

# Environments
group :development, :test do
  gem 'thin'
  gem 'tux'
  gem 'dotenv'
  gem 'minitest'
end

group :test, :production do
  gem 'unicorn'
end
