require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'

require_relative 'data_mapper_setup'

require './app/models/player'

use Rack::Flash
use Rack::MethodOverride

#tells you where your views are..
set :views, Proc.new { File.join(root, "", "views") }
set :public_folder, 'public'
enable :sessions

@@player1 = Player.new
@@player2 = Player.new

get '/' do
  erb :index
end

post '/' do
  if session[:character1]
    session[:character2] = params[:character]
    @character2 = session[:character2]
    @@player2.choose(@character2)
  else
    session[:character1] = params[:character]
    p Person.all
    @character1 = session[:character1]
    @@player1.choose(@character1)
  end
  erb :index
end

delete '/startagain' do
  session[:character1] = nil
  session[:character2] = nil
  redirect to '/'
end

get '/choose' do
  erb :choose
end

get '/game' do
  @traits = Trait.all
  @people = Person.all(up: true)
  erb :game
end

# start the server if ruby file executed directly
# run! if app_file == $0