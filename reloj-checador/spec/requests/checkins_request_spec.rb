require 'rails_helper'

RSpec.describe "Checkins", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/checkin"
      expect(response).to have_http_status(:success)
    end
  end

end
