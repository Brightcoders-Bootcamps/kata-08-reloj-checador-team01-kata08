require "rails_helper"

RSpec.describe AttendacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attendaces").to route_to("attendaces#index")
    end

    it "routes to #new" do
      expect(get: "/attendaces/new").to route_to("attendaces#new")
    end

    it "routes to #show" do
      expect(get: "/attendaces/1").to route_to("attendaces#show", id: "1")
    end

    # it "routes to #edit" do
    #   expect(get: "/attendaces/1/edit").to route_to("attendaces#edit", id: "1")
    # end

    it "routes to #create" do
      expect(post: "/attendaces").to route_to("attendaces#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attendaces/1").to route_to("attendaces#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attendaces/1").to route_to("attendaces#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attendaces/1").to route_to("attendaces#destroy", id: "1")
    end
  end
end
