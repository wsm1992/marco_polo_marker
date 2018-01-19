require 'rails_helper'

RSpec.describe Season, type: :model do
  subject{ Season.new(name: 'test') }

  it { is_expected.to respond_to(:name) }

  it 'get the name' do
    expect(subject.name).to eq 'test'
  end

  it 'get the max' do
    expect(Season.max).to eq 2
  end
end
