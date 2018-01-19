class Game < ActiveRecord::Base
  has_many :players
  belongs_to :season

  def avg_score
    player_list.avg_score
  end

  def player_list
    @player_list ||= PlayerList.new(players)
  end

  class << self
    def create_by_params(params)
      params = params.symbolize_keys
      validate_params(params)
      game = Game.create!
      4.times do |i|
        user_id = params[:user]["#{i}"].to_i
        role_id = params[:role]["#{i}"].to_i
        score = params[:score]["#{i}"].to_i
        is_last_traveller = (params[:is_last_traveller]["#{i}"] == "1")
        is_first_mover = (params[:is_first_mover]["#{i}"] == "1")
        Player.create(user_id: user_id, role_id: role_id, score: score, is_last_traveller: is_last_traveller, is_first_mover: is_first_mover, game: game)
      end
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
