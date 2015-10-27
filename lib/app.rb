require 'sinatra/base'

class Battle < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")

  get '/' do
    erb :index
  end

  post '/names' do
    @player1 = params[:player1]
    @player2 = params[:player2]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
