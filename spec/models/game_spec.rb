require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:users){ [] }
  let(:roles){ [] }
  let(:players){ [] }
  before do
    4.times do |i|
      user = User.new("User#{i}")
      role = Role.new("Role#{i}")
      player = Player.new(user, role, 50, false)
      users << user
      roles << role
      players << player
    end
  end
  subject{ Game.new(players[0], players[1], players[2], players[3]) }

  it 'get players' do
    4.times do |i|
      expect(subject.players[i]).to eq players[i]
    end
  end
end
