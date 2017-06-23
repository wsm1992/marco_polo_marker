require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:user){ User.new(name: 'user') }
  let(:role){ Role.new(name: 'role') }
  let(:game){ Game.new }
  subject{ Player.new(user: user, role: role, score: 50, is_last_traveller: false, is_first_mover: true, game: game) }

  it { is_expected.to respond_to(:game) }
  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:role) }
  it { is_expected.to respond_to(:score) }
  it { is_expected.to respond_to(:is_last_traveller) }

  it 'get the game' do
    expect(subject.game).to eq game
  end

  it 'get the user' do
    expect(subject.user).to eq user
  end

  it 'get the role' do
    expect(subject.role).to eq role
  end

  it 'get the score' do
    expect(subject.score).to eq 50
  end

  it 'get the is_last_traveller' do
    expect(subject.is_last_traveller).to eq false
  end

  it 'get the is_last_traveller' do
    expect(subject.is_first_mover).to eq true
  end
end
