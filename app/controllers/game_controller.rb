class GameController < ApplicationController
  def new
    @game = params[:game] || Game.new
  end

  def create
    @game = Game.create_by_params(params)
  end

  def list
    @games = Game.all
    @player_lists = []
    (1..4).each do |i|
      @player_lists << PlayerList.new(Player.where("user_id = ?", i))
    end
    @total_avg_score = @player_lists.map{|pl| pl.avg_score}.inject{|sum, s| sum + s}/4
  end
end
