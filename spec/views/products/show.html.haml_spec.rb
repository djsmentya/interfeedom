# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "products/show.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :description => "Description",
      :count_on_hand => 1,
      :properties => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
