require 'rails_helper'

RSpec.describe "Checkins", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/checkins/index"
      expect(response).to have_http_status(:success)
    end
  end

end
