require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")
  enable :sessions
  set :session_secret, "sdflkj"

  get '/' do
    erb :index
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1: player1, player2: player2)

    redirect 'play'
  end

  get '/play' do
    set_players

    erb :play
  end

  get '/attack' do
    set_players

    attacker, attacked = battling_players
    @message = "#{attacker.name} attacked #{attacked.name}!"
    $game.attack(params[:attacked])

    erb :play
  end

  helpers do
    def set_players
      @player1 = $game.player1
      @player2 = $game.player2
      @game = $game
    end

    def battling_players
      if params[:attacked] == "player1"
        [@player2, @player1]
      else
        [@player1, @player2]
      end
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
