require 'rails_helper'

RSpec.describe GameController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns success with params" do
      params = {"user"=>{"0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4"}, "role"=>{"0"=>"1", "1"=>"1", "2"=>"2", "3"=>"3"}, "score"=>{"0"=>"50", "1"=>"50", "2"=>"50", "3"=>"50"}, "is_last_traveller"=>{"0"=>"0", "1"=>"0", "2"=>"0", "3"=>"0"}}
      post :create, params
      game = Game.last
      4.times do |i|
        player = game.players[i]
        expect(player.user.id).to eq params["user"][i.to_s].to_i
        expect(player.role.id).to eq params["role"][i.to_s].to_i
        expect(player.score).to eq params["score"][i.to_s].to_i
        expect(player.is_last_traveller).to eq (params["is_last_traveller"][i.to_s] == "1")
      end
    end
  end
end
