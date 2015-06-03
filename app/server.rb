require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'

require_relative 'data_mapper_setup'

require './app/models/game'

use Rack::Flash
use Rack::MethodOverride

#tells you where your views are..
set :views, Proc.new { File.join(root, "", "views") }
set :public_folder, 'public'
enable :sessions

get '/' do
  Player.create
  Player.create
  erb :index
end

post '/' do
  if PersonPlayer.count == 0
    @player1 = Player.first
    @character1 = Person.first(name: params[:character])
    PersonPlayer.create(player_id: @player1.id,
                        person_id: @character1.id)
  else
    @player2 = Player.last
    @character2 = Person.first(name: params[:character])
    PersonPlayer.create(player_id: @player2.id,
                        person_id: @character2.id)
  end
  erb :index
end

get '/choose' do
  @people = Person.all
  erb :choose
end

get '/game' do
  @traits = Trait.all
  @game = Game.new
  @people = @game.show_all(1)
  session[:player_turn] = 1
  @player_turn = session[:player_turn]
  erb :game
end

post '/game' do
  # byebug
  question = params[:questions]
  @traits = Trait.all
  @game = Game.new
  if session[:player_turn] == 1
    character = PersonPlayer.last
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @answer = @game.ask(question, 1)
    @people = @game.show_all(1)
    session[:player_turn] = 2
  else
    character = PersonPlayer.first
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @answer = @game.ask(question, 2)
    @people = @game.show_all(2)
    session[:player_turn] = 1
  end
  @player_turn = session[:player_turn]
  erb :game
end

post '/guess' do
  # byebug
  guess = params[:guess_person]
  @traits = Trait.all
  @game = Game.new
  if session[:player_turn] == 1
    character = PersonPlayer.last
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @result = @game.is_it(guess)
    @people = @game.show_all(1)
    session[:player_turn] = 2
  else
    character = PersonPlayer.first
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @result = @game.is_it(guess)
    @people = @game.show_all(2)
    session[:player_turn] = 1
  end
  @player_turn = session[:player_turn]
  erb :game
end

# start the server if ruby file executed directly
# run! if app_file == $0