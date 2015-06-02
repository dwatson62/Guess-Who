require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'

require_relative 'data_mapper_setup'

require './app/models/player'

# use Rack::Flash

#tells you where your views are..
set :views, Proc.new { File.join(root, "", "views") }
set :public_folder, 'public'
enable :sessions

get '/' do
  erb :index
end

post '/' do
  if session[:character1]
    session[:character2] = params[:character]
    @character2 = session[:character2]
  else
    session[:character1] = params[:character]
    @character1 = session[:character1]
  end
  erb :index
end

get '/choose' do
  erb :choose
end

# start the server if ruby file executed directly
# run! if app_file == $0