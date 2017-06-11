require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:users){ [] }
  let(:roles){ [] }
  let(:players){ [] }
  subject{ Game.new }
  before do
    4.times do |i|
      user = User.create(name: "User#{i}")
      role = Role.create(name: "Role#{i}")
      player = Player.create(user: user, role: role, score: 50, is_last_traveller: false)
      users << user
      roles << role
      players << player
    end
    subject.players = players
  end

  it 'get players' do
    4.times do |i|
      expect(subject.players[i]).to eq players[i]
    end
  end
end
