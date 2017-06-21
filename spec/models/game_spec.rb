require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'game instance' do
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

  describe 'Game' do
    subject{ Game }
    let(:params){ {"user"=>{"0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4"}, "role"=>{"0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4"}, "score"=>{"0"=>"50", "1"=>"50", "2"=>"50", "3"=>"50"}, "is_last_traveller"=>{"0"=>"0", "1"=>"0", "2"=>"0", "3"=>"0"}} }

    it 'create by params' do
      game = Game.create_by_params(params)
      4.times do |i|
        player = game.players[i]
        expect(player.user.id).to eq params["user"][i.to_s].to_i
        expect(player.role.id).to eq params["role"][i.to_s].to_i
        expect(player.score).to eq params["score"][i.to_s].to_i
        expect(player.is_last_traveller).to eq (params["is_last_traveller"][i.to_s] == "1")
      end
    end

    it 'create fail with duplicate user' do
      params["user"]["1"] = "1"
      expect{ Game.create_by_params(params) }.to raise_error("duplicate user")
    end

    it 'create fail with duplicate role' do
      params["role"]["1"] = "1"
      expect{ Game.create_by_params(params) }.to raise_error("duplicate role")
    end
  end
end
