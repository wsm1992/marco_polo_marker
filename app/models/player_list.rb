class PlayerList
  attr_accessor :players
  def initialize(players)
    @players = players
  end

  def scores
    players.map{ |player| player.score}
  end

  def avg_score
    scores.inject{|sum, score| sum + score } / players.length.to_f    
  end
end
