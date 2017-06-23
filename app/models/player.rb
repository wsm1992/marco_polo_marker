class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :game

  def relative_score
    score - game.avg_score
  end
end
