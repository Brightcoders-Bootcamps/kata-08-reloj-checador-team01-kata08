require 'rails_helper'

RSpec.describe "Reports", type: :request do

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
