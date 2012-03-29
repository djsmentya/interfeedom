# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "supports/index.html.haml" do
  before(:each) do
    assign(:supports, [
      stub_model(Support,
        :subject => "Subject",
        :email => "Email",
        :message => "MyText"
      ),
      stub_model(Support,
        :subject => "Subject",
        :email => "Email",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of supports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
