require "sinatra"
require 'data_mapper'
require 'rack-flash'
require 'byebug'

  enable :sessions
  use Rack::Flash

  #This will allow us to use a new method in our server file, 'delete'
  use Rack::MethodOverride

  #tells you where your views are..
  set :views, Proc.new { File.join(root, "", "views") }

  # set :public_folder, proc { File.join(root) }

  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/guesswho_#{env}")

# require our class files here!!!

  # After declaring your models, you should finalise them
  DataMapper.finalize

  get '/' do
    "hello world"
  end

  # start the server if ruby file executed directly
  # run! if app_file == $0

