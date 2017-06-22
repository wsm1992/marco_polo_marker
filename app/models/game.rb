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

  def avg_score
    PlayerList.new(players).avg_score
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
      validate_params(params)
      players = []
      4.times do |i|
        user_id = params[:user]["#{i}"].to_i
        role_id = params[:role]["#{i}"].to_i
        score = params[:score]["#{i}"].to_i
        is_last_traveller = (params[:is_last_traveller]["#{i}"] == "1")
        is_first_mover = (params[:is_first_mover]["#{i}"] == "1")
        player = Player.create(user_id: user_id, role_id: role_id, score: score, is_last_traveller: is_last_traveller, is_first_mover: is_first_mover)
        players << player 
      end
      game = Game.new
      game.players = players
      game.save!
      game
    end

    private
    def validate_params(params)
      users = params[:user]
      roles = params[:role]
      scores = params[:score]
      is_lasts = params[:is_last_traveller]
      is_firsts = params[:is_first_mover]
      raise 'duplicate user' unless users.length == users.values.uniq.length
      raise 'duplicate role' unless roles.length == roles.values.uniq.length
      raise 'score empty' unless !scores.values.include?("")
      raise 'duplicate last traveller' unless is_lasts.values.count("1") <= 1
      raise 'duplicate first mover' unless is_firsts.values.count("1") <= 1
    end
  end
end
