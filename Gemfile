source 'https://rubygems.org'

# Common gems
gem 'sequel'
gem 'rake'
gem 'json'
gem 'sinatra'
gem 'pg'

# Environment specific gems
group :development, :test do
  gem 'shotgun'  # Dev server with code auto-reloading.
  gem 'tux'      # Console to debug directly into the current environment
  gem 'dotenv'   # Use of .env file with all necessary env vars
  gem 'minitest'
end

group :test, :production do
  gem 'unicorn'
end
