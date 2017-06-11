class Game < ActiveRecord::Base
  attr_accessor :players
  def initialize(player1, player2, player3, player4)
    @players = [player1, player2, player3, player4]
  end
end
