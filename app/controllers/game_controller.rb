class GameController < ApplicationController
  def new
    @game = params[:game] || Game.new
  end

  def create
    players = []
    4.times do |i|
      user_id = params[:user]["#{i}"].to_i
      role_id = params[:role]["#{i}"].to_i
      score = params[:score]["#{i}"].to_i
      is_last_traveller = (params[:is_last_traveller]["#{i}"] == "1")
      player = Player.create(user_id: user_id, role_id: role_id, score: score, is_last_traveller: is_last_traveller)
      players << player 
    end
    game = Game.new
    game.players = players
    game.save!
  end

  def list
    @games = Game.all
  end
end
