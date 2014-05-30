namespace :app do
  desc 'Run the application'
  task :run do
    if ENV['RACK_ENV'] == 'development'
      system "shotgun -s thin -p 3000 -o 0.0.0.0 config.ru"
    else
      system "bundle exec thin start"
    end
  end
end
