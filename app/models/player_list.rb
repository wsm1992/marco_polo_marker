class PlayerList
  attr_accessor :players
  def initialize(players)
    @players = players
  end

  def scores
    return [0] if players.length == 0
    players.map{ |player| player.score}
  end

  def avg_score
    scores.inject{|sum, score| sum + score } / players.length.to_f    
  end

  def max_score
    scores.max
  end

  def min_score
    scores.min
  end

  def user_count
    result = {}
    players.each do |p|
      if result[p.user_id].nil?
        result[p.user_id] = 1
      else
        result[p.user_id] += 1
      end
    end
    result
  end

  def role_count
    result = {}
    players.each do |p|
      if result[p.role_id].nil?
        result[p.role_id] = 1
      else
        result[p.role_id] += 1
      end
    end
    result
  end
end
