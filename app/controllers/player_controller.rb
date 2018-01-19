class PlayerController < ApplicationController
  def summary
    summary = params[:summary] || {user_id: "", role_id: "", is_last_traveller: '0', is_first_mover: '0', season_id: Season.max}
    hash = {}
    game_hash = {}
    hash[:user_id] = summary[:user_id] unless summary[:user_id] == ""
    hash[:role_id] = summary[:role_id] unless summary[:role_id] == ""
    hash[:is_last_traveller] = true if summary[:is_last_traveller] == '1'
    hash[:is_first_mover] = true if summary[:is_first_mover] == '1'
    hash[:games] = {season_id: summary[:season_id]} unless summary[:season_id] == ""
    @hash = hash
    @player_list = PlayerList.new(Player.joins(:game).where(hash))
  end
end
