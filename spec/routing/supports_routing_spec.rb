# -*- encoding : utf-8 -*-
require "spec_helper"

describe SupportsController do
  describe "routing" do

    it "routes to #index" do
      get("/supports").should route_to("supports#index")
    end

    it "routes to #new" do
      get("/supports/new").should route_to("supports#new")
    end

    it "routes to #show" do
      get("/supports/1").should route_to("supports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supports/1/edit").should route_to("supports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supports").should route_to("supports#create")
    end

    it "routes to #update" do
      put("/supports/1").should route_to("supports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supports/1").should route_to("supports#destroy", :id => "1")
    end

  end
end
