source 'https://rubygems.org'
ruby '1.9.3'

# Common
gem 'rake'
gem 'json'
gem 'pony'
gem 'thin'

# Framework
gem 'sinatra'
gem 'sinatra-contrib'

# DB
gem 'pg'
gem 'sequel'
gem 'sequel_pg', :require=>'sequel'
gem 'sequel_postgresql_triggers'

# Utils
gem 'rfc822'
gem 'dotenv'

# Environments
group :development, :test do
  gem 'shotgun'
  gem 'thin'
  gem 'tux'
  gem 'minitest'
end

group :production do
  gem 'unicorn'
end
