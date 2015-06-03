require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require 'database_cleaner'
require './app/server'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec, :cuke]

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

task :populate do
    Crowd.create()
    fred = Person.create(name: "Fred",
                         crowd_id: Crowd.first.id,
                         picture: '/images/fred.jpg')
    boris = Person.create(name: "Boris",
                          crowd_id: Crowd.first.id,
                          picture: '/images/boris.jpg')
    john = Person.create(name: "John",
                         crowd_id: Crowd.first.id,
                          picture: '/images/john.jpg')
    barry = Person.create(name: "Barry",
                          crowd_id: Crowd.first.id,
                           picture: '/images/barry.jpg')
    brian = Person.create(name: "Brian",
                          crowd_id: Crowd.first.id,
                           picture: '/images/brian.jpg')
    hat = Trait.create(description: "Hat")
    black_hair = Trait.create(description: "BlackHair")
    brown_hair = Trait.create(description: "BrownHair")
    PersonTraits.create(person_id: fred.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: boris.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: john.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: barry.id,
                        trait_id: brown_hair.id)
    puts "Development database populated with test data"
end