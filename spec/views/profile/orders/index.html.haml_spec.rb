require 'spec_helper'

describe "profile_orders/index.html.haml" do
  before(:each) do
    assign(:profile_orders, [
      stub_model(Profile::Order),
      stub_model(Profile::Order)
    ])
  end

  it "renders a list of profile_orders" do
    render
  end
end
