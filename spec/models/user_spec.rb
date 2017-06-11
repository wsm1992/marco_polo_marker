require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ User.new(name: 'test') }

  it { is_expected.to respond_to(:name) }

  it 'get the name' do
    expect(subject.name).to eq 'test'
  end
