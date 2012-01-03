require "spec_helper"

describe Profile::OrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/profile_orders").should route_to("profile_orders#index")
    end

    it "routes to #new" do
      get("/profile_orders/new").should route_to("profile_orders#new")
    end

    it "routes to #show" do
      get("/profile_orders/1").should route_to("profile_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/profile_orders/1/edit").should route_to("profile_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/profile_orders").should route_to("profile_orders#create")
    end

    it "routes to #update" do
      put("/profile_orders/1").should route_to("profile_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/profile_orders/1").should route_to("profile_orders#destroy", :id => "1")
    end

  end
end
