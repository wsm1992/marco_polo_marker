class PlayerList
  attr_accessor :players
  def initialize(players)
    @players = players
  end

  def scores
    return [0] if players.length == 0
    players.map{ |player| player.score}
  end

  def relative_scores
    return [0] if players.length == 0
    players.map{ |player| player.relative_score}
  end

  def avg_score(type = :normal)
    scores = scores_by_type(type)
    scores.mean
  end

  def max_score
    scores.max
  end

  def min_score
    scores.min
  end

  def median_score
    scores.median
  end

  def standard_deviation(type = :normal)
    scores = scores_by_type(type)
    scores.standard_deviation
  end

  def user_count
    attr_count(:user_id)
  end

  def role_count
    attr_count(:role_id)
  end

  def ranking_count
    attr_count(:ranking)
  end

  private
  def attr_count(attr)
    result = {}
    players.each do |p|
      key = p.send attr
      if result[key].nil?
        result[key] = 1
      else
        result[key] += 1
      end
    end
    result.sort.to_h
  end

  def scores_by_type(type)
    if type == :relative
      relative_scores
    elsif type == :normal
      scores
    else
      [-1]
    end
  end
end
