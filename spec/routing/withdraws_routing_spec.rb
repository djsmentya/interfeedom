require "spec_helper"

describe WithdrawsController do
  describe "routing" do

    it "routes to #index" do
      get("/withdraws").should route_to("withdraws#index")
    end

    it "routes to #new" do
      get("/withdraws/new").should route_to("withdraws#new")
    end

    it "routes to #show" do
      get("/withdraws/1").should route_to("withdraws#show", :id => "1")
    end

    it "routes to #edit" do
      get("/withdraws/1/edit").should route_to("withdraws#edit", :id => "1")
    end

    it "routes to #create" do
      post("/withdraws").should route_to("withdraws#create")
    end

    it "routes to #update" do
      put("/withdraws/1").should route_to("withdraws#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/withdraws/1").should route_to("withdraws#destroy", :id => "1")
    end

  end
end
