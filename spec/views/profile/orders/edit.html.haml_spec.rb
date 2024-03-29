# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "profile_orders/edit.html.haml" do
  before(:each) do
    @order = assign(:order, stub_model(Profile::Order))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profile_orders_path(@order), :method => "post" do
    end
  end
end
