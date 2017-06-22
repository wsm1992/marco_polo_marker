class PlayerController < ApplicationController
  def summary
    hash = {}
    hash[:user_id] = params[:user_id].to_s unless params[:user_id].nil?
    hash[:role_id] = params[:role_id].to_s unless params[:role_id].nil?
    @player_list = PlayerList.new(Player.where(hash))
  end
end
