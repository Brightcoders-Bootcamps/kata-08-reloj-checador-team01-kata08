require "rails_helper"
require "shared_contexts"

RSpec.describe "Welcomes", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let!(:admin) { FactoryBot.create(:admin) }

  before(:each) do
    @current_user = :admin
    login_as(admin, scope: :admin)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/welcome"
      expect(response).to have_http_status(:success)
    end
  end
end
