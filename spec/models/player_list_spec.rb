require 'rails_helper'

RSpec.describe PlayerList, type: :model do
  let(:user){ User.new(name: 'user') }
  let(:role){ Role.new(name: 'role') }
  let(:players){ [] }
  before do
    4.times do |i|
      player = Player.new(user: user, role: role, score: 50 + i, is_last_traveller: false, is_first_mover: true) 
      players << player
    end
  end
  subject{ PlayerList.new(players) }

  it { is_expected.to respond_to(:avg_score) }

  it 'get average score' do
    expect(subject.avg_score).to eq 51.5
  end
end
