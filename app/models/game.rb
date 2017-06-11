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
end
