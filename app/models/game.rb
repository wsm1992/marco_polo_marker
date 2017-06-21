class Game < ActiveRecord::Base
  ORDERS = [:first, :second, :third, :fourth]
  def players
    [self.first_player, second_player, third_player, fourth_player]
  end

  def players=(players)
    self.first_player_id= 1
    players.length.times do |i|
      self.send "#{ORDERS[i]}_player_id=", players[i].id
    end
  end
  
  [:first, :second, :third, :fourth].each do |order|
    define_method("#{order}_player") do
      player_id = self.send "#{order}_player_id"
      Player.find_by_id(player_id)
    end
  end

  class << self
    def create_by_params(params)
      params = params.symbolize_keys
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
      game
    end
  end
end
