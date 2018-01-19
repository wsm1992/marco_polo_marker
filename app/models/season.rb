class Season < ActiveRecord::Base
  has_many :games

  class << self
    def max
      return Season.last.id
    end
  end
end
