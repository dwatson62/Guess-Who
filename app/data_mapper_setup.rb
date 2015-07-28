env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/guesswho_#{env}")

require './app/models/crowd'
require './app/models/person'
require './app/models/person_player'
require './app/models/person_traits'
require './app/models/player'
require './app/models/trait'

DataMapper.finalize

DataMapper.auto_upgrade!
