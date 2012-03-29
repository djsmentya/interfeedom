# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "products/info.html.haml" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :description => "Description",
        :count_on_hand => 1,
        :properties => nil
      ),
      stub_model(Product,
        :name => "Name",
        :description => "Description",
        :count_on_hand => 1,
        :properties => nil
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
