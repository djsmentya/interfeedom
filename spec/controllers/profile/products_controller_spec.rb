# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Profile::ProductsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
