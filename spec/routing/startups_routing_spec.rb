require "spec_helper"

describe StartupsController do
  describe "routing" do

    it "routes to #index" do
      get("/me/startups").should route_to("startups#index")
    end

    it "routes to #new" do
      get("/me/startups/new").should route_to("startups#new")
    end

    it "routes to #show" do
      get("/me/startups/1").should route_to("startups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/me/startups/1/edit").should route_to("startups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/me/startups").should route_to("startups#create")
    end

    it "routes to #update" do
      put("/me/startups/1").should route_to("startups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/me/startups/1").should route_to("startups#destroy", :id => "1")
    end

  end
end
