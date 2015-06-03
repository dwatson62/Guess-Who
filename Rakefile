require 'data_mapper'
require 'database_cleaner'
require './app/server'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec]

task :auto_upgrade do
  # auto_upgrade makes non-destructive changes.
  # If your tables don't exist, they will be created
  # but if they do and you changed your schema
  # (e.g. changed the type of one of the properties)
  # they will not be upgraded because that'd lead to data loss.
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  # To force the creation of all tables as they are
  # described in your models, even if this
  # may lead to data loss, use auto_migrate:
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end

task :database_cleaner do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
  DatabaseCleaner.start
  puts 'Database cleaned'
end

task :populate_local do
  env = ENV['RACK_ENV]'] || 'development'
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/guesswho_#{env}")
  require './crowd_data'
  april_db
end

task :populate_remote do
  DataMapper.setup(:default,  "postgres://qekcokqxsmmhyx:U6D6ctPM8ou3sXJqkugBEt26Z1@ec2-54-197-224-173.compute-1.amazonaws.com:5432/d9t0v2bnqu246p")

  DataMapper.finalize

  DataMapper.auto_upgrade!

  require './crowd_data'
  april_db
end

task :reset_local do
  DataMapper.setup(:default,  "postgres://localhost/guesswho_development")

  DataMapper.finalize

  DataMapper.auto_upgrade!

  people = Person.all
  people.each do |x|
    x.up1 = true
    x.up2 = true
    x.save
  end
end

task :reset_remote do
  DataMapper.setup(:default, "postgres://qekcokqxsmmhyx:U6D6ctPM8ou3sXJqkugBEt26Z1@ec2-54-197-224-173.compute-1.amazonaws.com:5432/d9t0v2bnqu246p")

  DataMapper.finalize

  DataMapper.auto_upgrade!

  people = Person.all
  people.each do |x|
    x.up1 = true
    x.up2 = true
    x.save
  end
end