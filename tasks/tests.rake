# Rake::TestTask is really highly overpowered and heavy
# we only need to load tests files in an easy and comprehensible way
#
# Nice article about this easier and cleaner solution :
# http://crashruby.com/2013/05/10/running-a-minitest-suite/

namespace :test do

  $LOAD_PATH.unshift(File.dirname(__FILE__))

  desc "run db related tests"
  task :models do
    Dir.glob('./spec/models/*_spec.rb') { |f| require f }
  end

  desc "run app related tests"
  task :app do
    Dir.glob('./spec/app/*_spec.rb') { |f| require f }
  end

  desc "run all tests"
  task :all do
    Rake::Task['test:models'].execute
    Rake::Task['test:app'].execute
  end

end

task :test => 'test:all'
