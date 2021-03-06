require "rails_helper"
require "shared_contexts"
# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/companies", type: :request do
  # Company. As you add validations to Company, be sure to
  # adjust the attributes here as well.

  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let!(:admin) { FactoryBot.create(:admin) }

  let(:valid_attributes) {
    FactoryBot.create(:company)
  }

  let(:valid_attributes_for_creation) { { name: "Company Test 2", address: "Address Company Test 2" } }

  let(:invalid_attributes) { { name: nil, address: nil } }

  before(:each) do
    @current_user = :admin
    login_as(admin, scope: :admin)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get companies_path, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = valid_attributes
      get company_url(company)
      expect(response).to be_successful
    end

    it "redirect to companies_url if company`s id is invalid" do
      get companies_url( Company.count + rand(1..100) )
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_company_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      company = valid_attributes
      get edit_company_url(company)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url, params: { company: valid_attributes_for_creation }
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created company" do
        post companies_url, params: { company: valid_attributes_for_creation }
        expect(response).to redirect_to(companies_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url, params: { company: invalid_attributes }
        }.to change(Company, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post companies_url, params: { company: invalid_attributes }
        expect(response).to redirect_to(new_company_url)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Company Name updated", address: "Company address Updated" }
      }

      it "updates the requested company" do
        company = valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        # skip("Add assertions for updated state")
        expect(company.attributes).to include({ "name" => "#{new_attributes[:name]}", "address" => "#{new_attributes[:address]}" })
      end

      it "redirects to the company" do
        company = valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(response).to redirect_to(company_url(company))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        company = valid_attributes
        patch company_url(company), params: { company: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = valid_attributes
      expect {
        delete company_url(company)
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = valid_attributes
      delete company_url(company)
      expect(response).to redirect_to(companies_url)
    end
  end
end
