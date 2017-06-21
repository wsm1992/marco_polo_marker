class GameController < ApplicationController
  def new
    @game = params[:game] || Game.new
  end

  def create
    @game = Game.create_by_params(params)
  end

  def list
    @games = Game.all
  end
end
