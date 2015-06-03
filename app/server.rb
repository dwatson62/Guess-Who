require 'byebug'
require './crowd_data'
require 'database_cleaner'
require 'data_mapper'
require 'rack-flash'
require 'sinatra'

require_relative 'data_mapper_setup'

require './app/models/game'

use Rack::Flash
use Rack::MethodOverride

set :views, proc { File.join(root, '', 'views') }
set :public_folder, 'public'
enable :sessions
set :session_secret, 'super secret'

get '/' do
  # april_db
  # 2.times { Player.create }
  erb :index
end

post '/' do
  if PersonPlayer.count == 0
    player = Player.first
    @character1 = Person.first(name: params[:character])
    PersonPlayer.create(player_id: player.id,
                        person_id: @character1.id)
  else
    player = Player.last
    @character2 = Person.first(name: params[:character])
    PersonPlayer.create(player_id: player.id,
                        person_id: @character2.id)
  end
  erb :index
end

get '/choose' do
  @people = Person.all
  erb :choose
end

get '/game' do
  @game = Game.new
  prepare_game_screen
  session[:player_turn] = 1
  @player_turn = session[:player_turn]
  erb :game
end

post '/game' do
  question = params[:questions]
  @game = Game.new
  if session[:player_turn] == 1
    find(PersonPlayer.last)
    @answer = @game.ask(question, 1)
  else
    find(PersonPlayer.first)
    @answer = @game.ask(question, 2)
  end
  next_player_turn
  prepare_game_screen
  @player_turn = session[:player_turn]
  erb :game
end

post '/guess' do
  # byebug
  if session[:player_turn] == 1
    find(PersonPlayer.last)
    @result = @game.is_it(params[:guess_person], 1)
  else
    find(PersonPlayer.first)
    @result = @game.is_it(params[:guess_person], 2)
  end

  redirect to '/win' if @result == 'You win!'

  next_player_turn
  prepare_game_screen
  @player_turn = session[:player_turn]
  erb :game
end

get '/win' do
  @player_turn = session[:player_turn]
  erb :win
end

delete '/startagain' do
  # DatabaseCleaner.strategy = :transaction
  # DatabaseCleaner.clean_with(:truncation)
  # DatabaseCleaner.start
  redirect to '/'
end

def next_player_turn
  if session[:player_turn] == 1
    session[:player_turn] = 2
  else
    session[:player_turn] = 1
  end
end

def find(character)
  @game = Game.new
  character = Person.first(id: character.person_id)
  @game.select(character.name)
end

def prepare_game_screen
  @traits = Trait.all
  @people1 = @game.show_all(1)
  @people2 = @game.show_all(2)
end
