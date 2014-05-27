namespace :app do
  desc 'Run the application'
  task :run do
      system "bundle exec thin start"
  end
end
