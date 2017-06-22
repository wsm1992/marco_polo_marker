require 'rails_helper'

RSpec.describe PlayerController, type: :controller do

  describe "GET #summary" do
    it "returns http success" do
      get :summary
      expect(response).to have_http_status(:success)
    end
  end

end
