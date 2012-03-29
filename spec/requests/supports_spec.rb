# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Supports" do
  describe "GET /supports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get supports_path
      response.status.should be(200)
    end
  end
end
