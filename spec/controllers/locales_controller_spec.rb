# -*- encoding : utf-8 -*-
require 'spec_helper'

describe LocalesController do

  describe "GET 'change_locale'" do
    it "returns http success" do
      get 'change_locale'
      response.should be_success
    end
  end

end
