namespace :db do

  MIGRATIONS_PATH='db/migrations'
  SEEDS_PATH='db/seeds'

  require './config/db'
  Sequel.extension :migration

  desc "Prints current schema version"
  task :version do
    version = DB[:schema_info] ? DB[:schema_info].first[:version] : 0
    puts "Schema Version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, MIGRATIONS_PATH)
    Rake::Task['db:version'].execute
  end

  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, MIGRATIONS_PATH, :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB, MIGRATIONS_PATH, :target => 0)
    Sequel::Migrator.run(DB, MIGRATIONS_PATH)
    Rake::Task['db:version'].execute
  end

  desc "Insert default dataset into the database for the current environment"
  task :seed do
    require 'json'
    Dir.glob("#{SEEDS_PATH}/#{ENV['RACK_ENV']}/*.json") do |json|
      dataset = JSON.parse(IO.read(json))
      dataset.each do |table, data|
        model = DB[table.to_sym]
        data.each do |set|
          set = set.reduce({}) {|memo, (k, v)| memo.merge({ k.to_sym => v})}
          model.insert(set)
        end
      end
    end
  end

end #namespace :db
