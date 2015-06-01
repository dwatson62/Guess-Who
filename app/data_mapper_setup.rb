env = ENV['RACK_ENV]'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/guesswho_#{env}")

require './app/models/person'
require './app/models/trait'
require './app/models/crowd'


DataMapper.finalize

DataMapper.auto_upgrade!