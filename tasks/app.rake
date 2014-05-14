namespace :app do
  desc 'Start the application'
  task :start do
      system "bundle exec shotgun -o 0.0.0.0 config.ru"
  end
end
