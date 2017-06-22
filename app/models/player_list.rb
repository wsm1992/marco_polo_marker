class PlayerList
  attr_accessor :players
  def initialize(players)
    @players = players
  end

  def avg_score
    players.map{ |player| player.score}.inject{|sum, score| sum + score } / players.length.to_f    
  end
end
