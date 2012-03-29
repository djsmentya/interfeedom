# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "GuestBooks" do
  describe "GET /guest_books" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get guest_books_path
      response.status.should be(200)
    end
  end
end
