class Player < ActiveRecord::Base
  attr_accessor :user, :role, :score, :is_last_traveller

  def initialize(user, role, score, is_last_traveller)
    @user = user
    @role = role
    @score = score
    @is_last_traveller = is_last_traveller
  end
end
