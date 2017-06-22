require 'rails_helper'

RSpec.describe PlayerList, type: :model do
  let(:user){ User.first }
  let(:role){ Role.first }
  let(:players){ [] }
  before do
    4.times do |i|
      player = Player.new(user: user, role: role, score: 50 + i, is_last_traveller: false, is_first_mover: true) 
      players << player
    end
  end
  subject{ PlayerList.new(players) }

  it { is_expected.to respond_to(:scores) }
  it { is_expected.to respond_to(:avg_score) }
  it { is_expected.to respond_to(:max_score) }
  it { is_expected.to respond_to(:min_score) }

  it 'get scores' do
    expect(subject.scores).to eq [50, 51, 52, 53]
  end

  it 'get average score' do
    expect(subject.avg_score).to eq 51.5
  end

  it 'get max score' do
    expect(subject.max_score).to eq 53
  end

  it 'get min score' do
    expect(subject.min_score).to eq 50
  end

  it 'get user count' do
    expect(subject.user_count).to eq ({1 => 4})
  end

  it 'get role count' do
    expect(subject.role_count).to eq ({1 => 4})
  end
end
