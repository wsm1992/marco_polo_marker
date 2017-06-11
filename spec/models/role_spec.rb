require 'rails_helper'

RSpec.describe Role, type: :model do
  subject{ Role.new('Marco Polo') }

  it { is_expected.to respond_to(:name) }

  it 'get the name' do
    expect(subject.name).to eq 'Marco Polo'
  end
end
