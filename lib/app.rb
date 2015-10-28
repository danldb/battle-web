require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")
  enable :sessions
  set :session_secret, "sdflkj"

  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect 'play'
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    erb :play
  end

  get '/attack' do
    set_players
    game = Game.new
    @message = "#{@player1.name} attacked #{@player2.name}!"
    game.attack(@player2)
    erb :play
  end

  helpers do
    def set_players
      @player1 = $player1
      @player2 = $player2
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
