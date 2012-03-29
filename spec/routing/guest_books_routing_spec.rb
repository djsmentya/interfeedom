# -*- encoding : utf-8 -*-
require "spec_helper"

describe GuestBooksController do
  describe "routing" do

    it "routes to #index" do
      get("/guest_books").should route_to("guest_books#index")
    end

    it "routes to #new" do
      get("/guest_books/new").should route_to("guest_books#new")
    end

    it "routes to #show" do
      get("/guest_books/1").should route_to("guest_books#show", :id => "1")
    end

    it "routes to #edit" do
      get("/guest_books/1/edit").should route_to("guest_books#edit", :id => "1")
    end

    it "routes to #create" do
      post("/guest_books").should route_to("guest_books#create")
    end

    it "routes to #update" do
      put("/guest_books/1").should route_to("guest_books#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/guest_books/1").should route_to("guest_books#destroy", :id => "1")
    end

  end
end
