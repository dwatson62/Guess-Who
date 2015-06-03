require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'
require 'database_cleaner'
require './spec/features/helpers'

require_relative 'data_mapper_setup'

require './app/models/game'

use Rack::Flash
use Rack::MethodOverride

#tells you where your views are..
set :views, Proc.new { File.join(root, "", "views") }
set :public_folder, 'public'
set :session_secret, 'super secret'
enable :sessions

get '/' do
  test_db1
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
  @people1 = @game.show_all(1)
  @people2 = @game.show_all(2)
  session[:player_turn] = 1
  @player_turn = session[:player_turn]
  erb :game
end

post '/game' do
  question = params[:questions]
  @traits = Trait.all
  @game = Game.new
  if session[:player_turn] == 1
    character = PersonPlayer.last
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @answer = @game.ask(question, 1)
    @people1 = @game.show_all(1)
    @people2 = @game.show_all(2)
    session[:player_turn] = 2
  else
    character = PersonPlayer.first
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @answer = @game.ask(question, 2)
    @people1 = @game.show_all(1)
    @people2 = @game.show_all(2)
    session[:player_turn] = 1
  end
  @player_turn = session[:player_turn]
  erb :game
end

post '/guess' do
  guess = params[:guess_person]
  @traits = Trait.all
  @game = Game.new
  if session[:player_turn] == 1
    character = PersonPlayer.last
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @result = @game.is_it(guess)
    if @result == 'You win!'
      redirect to '/win'
    end
    @people1 = @game.show_all(1)
    @people2 = @game.show_all(2)
    session[:player_turn] = 2
  else
    character = PersonPlayer.first
    character = Person.first(id: character.person_id)
    @game.choose(character.name)
    @result = @game.is_it(guess)
    if @result == 'You win!'
      redirect to '/win'
    end
    @people1 = @game.show_all(1)
    @people2 = @game.show_all(2)
    session[:player_turn] = 1
  end
  @player_turn = session[:player_turn]
  erb :game
end

get '/win' do
  @player_turn = session[:player_turn]
  erb :win
end

delete '/startagain' do
  session[:player_turn] = nil
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
  DatabaseCleaner.start
  redirect to '/'
end

# start the server if ruby file executed directly
# run! if app_file == $0