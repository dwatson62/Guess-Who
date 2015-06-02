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

  @@game1 = Game.new
  @@game2 = Game.new

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
    @@game1.choose(@character1.name)
  else
    @player2 = Player.last
    @character2 = Person.first(name: params[:character])
    PersonPlayer.create(player_id: @player2.id,
                        person_id: @character2.id)
    @@game2.choose(@character2.name)
  end
  erb :index
end

delete '/startagain' do
  session[:character1] = nil
  session[:character2] = nil
  redirect to '/'
end

get '/choose' do
  @people = Person.all
  erb :choose
end

get '/game' do
  @traits = Trait.all
  @people = Person.all(up: true)
  erb :game
end

post '/game' do
  question = params[:questions]
  @@game1.ask(question)
  @traits = Trait.all
  @people = Person.all(up: true)
  erb :game
end

# start the server if ruby file executed directly
# run! if app_file == $0