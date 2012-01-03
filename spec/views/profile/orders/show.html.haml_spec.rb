require 'spec_helper'

describe "profile_orders/show.html.haml" do
  before(:each) do
    @order = assign(:order, stub_model(Profile::Order))
  end

  it "renders attributes in <p>" do
    render
  end
end
