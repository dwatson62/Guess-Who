require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'

require_relative 'data_mapper_setup'

require './app/models/person'
require './app/models/trait'
require './app/models/crowd'

  enable :sessions
  use Rack::Flash

  #This will allow us to use a new method in our server file, 'delete'
  use Rack::MethodOverride

  #tells you where your views are..
  set :views, Proc.new { File.join(root, "", "views") }

  # set :public_folder, proc { File.join(root) }

  get '/' do
    "hello world"
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0

