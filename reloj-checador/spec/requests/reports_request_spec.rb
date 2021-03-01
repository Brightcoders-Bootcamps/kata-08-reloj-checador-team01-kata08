require "rails_helper"
require "shared_contexts"

RSpec.describe "Reports", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let!(:admin) { FactoryBot.create(:admin) }

  before(:each) do
    @current_user = :admin
    login_as(admin, scope: :admin)
  end

  describe "GET /att_by_day" do
    it "returns http success" do
      get "/reports/att_by_day"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /avg_time_by_employees" do
    it "returns http success" do
      get "/reports/avg_time_by_employees"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /absence_by_month" do
    it "returns http success" do
      get "/reports/absence_by_month"
      expect(response).to have_http_status(:success)
    end
  end
end
