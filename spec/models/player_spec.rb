require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:user){ User.new('user') }
  let(:role){ Role.new('role') }
  subject{ Player.new(user, role, 50, false) }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:role) }
  it { is_expected.to respond_to(:score) }
  it { is_expected.to respond_to(:is_last_traveller) }

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
end
